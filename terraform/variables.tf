variable "ARM_TENANT_ID" {
  description = "Azure Tenant ID"
  type        = string
  sensitive = true
}

variable "ARM_SUBSCRIPTION_ID" {
  description = "Azure Subscription ID"
  type        = string
  sensitive = true
}

variable "VM_ADMIN_PASSWORD" {
  description = "Azure VM ADMIN PASSWORD"
  type        = string
  sensitive = true
}

variable "VM_ADMIN_USERNAME" {
  description = "Azure VM ADMIN USERNAME"
  type        = string
  sensitive = true
}