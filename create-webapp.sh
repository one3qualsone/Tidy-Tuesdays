#!/bin/bash

# Script to create a Static Web App in the correct subscription and resource group
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}Creating Static Web App in the correct subscription${NC}"
echo "---------------------------------------------------------------------"

# Ensure we're logged in
az account show &>/dev/null || az login

# Explicitly set the correct subscription
echo -e "${BLUE}Setting subscription to f9b632a4-562f-4070-b7f5-b094dc72811c...${NC}"
az account set --subscription "f9b632a4-562f-4070-b7f5-b094dc72811c"

# Verify the subscription
current_sub=$(az account show --query id -o tsv)
if [ "$current_sub" != "f9b632a4-562f-4070-b7f5-b094dc72811c" ]; then
    echo -e "${RED}Failed to set the correct subscription. Current subscription: $current_sub${NC}"
    exit 1
fi

# Check if resource group exists, create if not
echo -e "${BLUE}Checking if resource group 'tidy-tuesdays' exists...${NC}"
rg_exists=$(az group exists --name tidy-tuesdays)
if [ "$rg_exists" == "false" ]; then
    echo -e "${BLUE}Creating resource group 'tidy-tuesdays'...${NC}"
    az group create --name tidy-tuesdays --location westeurope
fi

# Create the Static Web App in the correct location
echo -e "${BLUE}Creating Static Web App in westeurope...${NC}"
az staticwebapp create \
  --name "tidy-tuesdays-correct" \
  --resource-group "tidy-tuesdays" \
  --location "westeurope" \
  --sku "Free"

# Get the deployment token
echo -e "${BLUE}Getting deployment token...${NC}"
api_token=$(az staticwebapp secrets list \
  --name "tidy-tuesdays-correct" \
  --resource-group "tidy-tuesdays" \
  --query "properties.apiKey" -o tsv)

# Get the default hostname
hostname=$(az staticwebapp show \
  --name "tidy-tuesdays-correct" \
  --resource-group "tidy-tuesdays" \
  --query "defaultHostname" -o tsv)

# Display results
echo -e "${GREEN}Static Web App created successfully in the correct subscription!${NC}"
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