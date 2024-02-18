variable "name" {
    description = "name of the 3s bucket"
    type        = string
}

variable "inline_policy" {
  description = "An optional configuration block defining an exclusive set of IAM inline policies associated with the IAM role"
  type        = string
  default     = null
}
