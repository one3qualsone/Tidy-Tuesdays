variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "tidy-tuesdays"
}

variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "uksouth"
}

variable "static_site_name" {
  description = "Name of the Static Web App"
  type        = string
  default     = "tidy-tuesdays"
}

variable "custom_domain" {
  description = "Custom domain for the Static Web App"
  type        = string
  default     = "tidy-tuesdays.oneequalsone.uk"
}

variable "github_repo" {
  description = "GitHub repository URL"
  type        = string
  default     = "https://github.com/yourusername/tidy-tuesdays"
}

variable "github_branch" {
  description = "GitHub branch to deploy from"
  type        = string
  default     = "main"
}