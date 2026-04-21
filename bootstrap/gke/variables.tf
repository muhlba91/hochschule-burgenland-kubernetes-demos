variable "project_id" {
  description = "project id"
  type        = string
}
variable "region" {
  description = "region"
  type        = string
  default     = "europe-west4"
}
variable "zone" {
  description = "zone"
  type        = string
  default     = "europe-west4-a"
}

variable "k8s_namespace" {
  description = "kubernetes namespace"
  type        = string
  default     = "default"
}

variable "k8s_service_account_name" {
  description = "kubernetes service account name"
  type        = string
  default     = "gcs-reader"
}
