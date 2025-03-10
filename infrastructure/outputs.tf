output "static_web_app_url" {
  description = "The default URL for the Static Web App"
  value       = azurerm_static_site.tidy_tuesdays.default_host_name
}

output "static_web_app_api_token" {
  description = "The deployment token for the Static Web App (use this in GitHub Actions)"
  value       = azurerm_static_site.tidy_tuesdays.api_key
  sensitive   = true
}

output "resource_group_id" {
  description = "The ID of the resource group"
  value       = azurerm_resource_group.tidy_tuesdays.id
}

output "static_web_app_id" {
  description = "The ID of the Static Web App"
  value       = azurerm_static_site.tidy_tuesdays.id
}