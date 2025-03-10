#!/bin/bash

# Script to create a Static Web App in the correct subscription and resource group
# Uses environment variables for sensitive information

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}Setting up Static Web App from environment variables${NC}"
echo "---------------------------------------------------------------------"

# Check if .env file exists and load it
if [ -f .env ]; then
    echo -e "${BLUE}Loading environment variables from .env file...${NC}"
    export $(grep -v '^#' .env | xargs)
else
    echo -e "${RED}Error: .env file not found. Please copy .env.template to .env and fill in your values.${NC}"
    echo "---------------------------------------------------------------------"
    echo -e "${BLUE}Creating .env from template...${NC}"
    cp .env.template .env
    echo -e "${GREEN}Created .env file. Please edit it with your actual values and run this script again.${NC}"
    exit 1
fi

# Validate required environment variables
REQUIRED_VARS=("AZURE_SUBSCRIPTION_ID" "AZURE_RESOURCE_GROUP" "AZURE_STATIC_WEBAPP_NAME" "AZURE_REGION")
MISSING_VARS=false

for VAR in "${REQUIRED_VARS[@]}"; do
    if [ -z "${!VAR}" ]; then
        echo -e "${RED}Error: $VAR is not set in .env file.${NC}"
        MISSING_VARS=true
    fi
done

if [ "$MISSING_VARS" = true ]; then
    echo -e "${RED}Please fill in all required variables in .env file and run again.${NC}"
    exit 1
fi

# Ensure we're logged in
az account show &>/dev/null || az login

# Set the correct subscription
echo -e "${BLUE}Setting subscription to $AZURE_SUBSCRIPTION_ID...${NC}"
az account set --subscription "$AZURE_SUBSCRIPTION_ID"

# Verify the subscription
current_sub=$(az account show --query id -o tsv)
if [ "$current_sub" != "$AZURE_SUBSCRIPTION_ID" ]; then
    echo -e "${RED}Failed to set the correct subscription. Current subscription: $current_sub${NC}"
    exit 1
fi

# Check if resource group exists, create if not
echo -e "${BLUE}Checking if resource group '$AZURE_RESOURCE_GROUP' exists...${NC}"
rg_exists=$(az group exists --name "$AZURE_RESOURCE_GROUP")
if [ "$rg_exists" == "false" ]; then
    echo -e "${BLUE}Creating resource group '$AZURE_RESOURCE_GROUP'...${NC}"
    az group create --name "$AZURE_RESOURCE_GROUP" --location "$AZURE_REGION"
fi

# Create the Static Web App
echo -e "${BLUE}Creating Static Web App '$AZURE_STATIC_WEBAPP_NAME' in $AZURE_REGION...${NC}"
az staticwebapp create \
  --name "$AZURE_STATIC_WEBAPP_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --location "$AZURE_REGION" \
  --sku "${AZURE_SKU_TIER:-Free}"

# Get the deployment token
echo -e "${BLUE}Getting deployment token...${NC}"
api_token=$(az staticwebapp secrets list \
  --name "$AZURE_STATIC_WEBAPP_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "properties.apiKey" -o tsv)

# Get the default hostname
hostname=$(az staticwebapp show \
  --name "$AZURE_STATIC_WEBAPP_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "defaultHostname" -o tsv)

# Display results
echo -e "${GREEN}Static Web App created successfully!${NC}"
echo "---------------------------------------------------------------------"
echo -e "${BLUE}API Token for GitHub:${NC}"
echo -e "${GREEN}$api_token${NC}"
echo ""
echo -e "${BLUE}Important: Update your GitHub repository secret:${NC}"
echo "1. Go to your GitHub repository → Settings → Secrets and variables → Actions"
echo "2. Edit the existing secret 'AZURE_STATIC_WEB_APPS_API_TOKEN'"
echo "3. Replace with the new token shown above"
echo "---------------------------------------------------------------------"
echo -e "${BLUE}Default URL:${NC} https://$hostname"
echo "---------------------------------------------------------------------"