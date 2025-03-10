#!/bin/bash

# Simple script to create Static Web App in a supported region and get the API token
# Key point: Static Web Apps are NOT available in uksouth - we'll use westeurope instead

# Colors for better readability
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}Creating Static Web App and Getting API Token${NC}"
echo "---------------------------------------------------------------------"

# Make sure we're logged in
az account show &>/dev/null || az login

# Set subscription
echo -e "${BLUE}Setting subscription...${NC}"
az account set --subscription "f9b632a4-562f-4070-b7f5-b094dc72811c"

# Create resource group if it doesn't exist
echo -e "${BLUE}Creating resource group (if it doesn't exist)...${NC}"
az group create --name tidy-tuesdays --location westeurope

# Create Static Web App (using westeurope as it's available for Static Web Apps)
echo -e "${BLUE}Creating Static Web App...${NC}"
az staticwebapp create \
  --name tidy-tuesdays \
  --resource-group tidy-tuesdays \
  --location westeurope \
  --sku Free

# Get the deployment token (API key)
echo -e "${BLUE}Getting deployment token...${NC}"
API_TOKEN=$(az staticwebapp secrets list \
  --name tidy-tuesdays \
  --resource-group tidy-tuesdays \
  --query "properties.apiKey" -o tsv)

# Get the default hostname
HOSTNAME=$(az staticwebapp show \
  --name tidy-tuesdays \
  --resource-group tidy-tuesdays \
  --query "defaultHostname" -o tsv)

# Display results
echo -e "${GREEN}Static Web App created successfully!${NC}"
echo "---------------------------------------------------------------------"
echo -e "${BLUE}API Token for GitHub:${NC}"
echo -e "${GREEN}$API_TOKEN${NC}"
echo ""
echo -e "${BLUE}Add this token to your GitHub repository as:${NC}"
echo "Name: AZURE_STATIC_WEB_APPS_API_TOKEN"
echo "Value: (the token shown above)"
echo "---------------------------------------------------------------------"
echo -e "${BLUE}Default URL:${NC} https://$HOSTNAME"
echo "---------------------------------------------------------------------"