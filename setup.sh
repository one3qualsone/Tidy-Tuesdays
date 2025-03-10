#!/bin/bash

# Setup script for Tidy Tuesdays project
# This script helps set up the necessary resources in Azure and configure GitHub

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}Tidy Tuesdays Project Setup${NC}"
echo "This script will help you set up the necessary resources for your project."
echo "---------------------------------------------------------------------"

# Check if Azure CLI is installed
if ! command -v az &> /dev/null; then
    echo -e "${RED}Azure CLI is not installed. Please install it first.${NC}"
    echo "Visit: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli"
    exit 1
fi

# Check if Terraform is installed
if ! command -v terraform &> /dev/null; then
    echo -e "${RED}Terraform is not installed. Please install it first.${NC}"
    echo "Visit: https://learn.hashicorp.com/tutorials/terraform/install-cli"
    exit 1
fi

# Login to Azure
echo -e "${BLUE}Logging in to Azure...${NC}"
az login

# Select subscription
echo -e "${BLUE}Listing your Azure subscriptions:${NC}"
az account list --output table

echo -e "${BLUE}Please enter the subscription ID or name you want to use:${NC}"
read subscription_id
az account set --subscription "$subscription_id"
echo -e "${GREEN}Subscription set successfully.${NC}"

# Initialize Terraform
echo -e "${BLUE}Initializing Terraform...${NC}"
cd infrastructure
terraform init

# Apply Terraform configuration
echo -e "${BLUE}Creating Azure resources...${NC}"
terraform apply -auto-approve

# Get outputs
static_web_app_url=$(terraform output -raw static_web_app_url)
static_web_app_api_token=$(terraform output -raw static_web_app_api_token)

echo -e "${GREEN}Resources created successfully!${NC}"
echo "---------------------------------------------------------------------"
echo -e "${BLUE}GitHub Setup Instructions:${NC}"
echo "1. Create a new GitHub repository named 'tidy-tuesdays'"
echo "2. Push your code to the repository"
echo "3. Add the following secret to your GitHub repository:"
echo "   Name: AZURE_STATIC_WEB_APPS_API_TOKEN"
echo "   Value: $static_web_app_api_token"
echo "---------------------------------------------------------------------"
echo -e "${BLUE}Custom Domain Setup:${NC}"
echo "1. In the Azure Portal, navigate to your Static Web App"
echo "2. Go to 'Custom domains'"
echo "3. Add your custom domain: tidy-tuesdays.oneequalsone.uk"
echo "4. Create a CNAME record in your DNS provider pointing to: $static_web_app_url"
echo "---------------------------------------------------------------------"

echo -e "${GREEN}Setup complete!${NC}"
echo "Your website will be automatically deployed when you push to your GitHub repository."