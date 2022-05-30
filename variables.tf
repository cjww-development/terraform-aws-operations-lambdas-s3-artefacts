variable "region" {
  type        = string
  description = "The AWS region that IaC will provision the defined infrastructure"
}

variable "bucket_name" {
  type        = string
  description = "The name given to the created bucket"
}

variable "canned_acl" {
  type        = string
  description = "The canned ACL used to limit access"
  validation {
    condition = contains(
      [
        "private",
        "public-read",
        "public-read-write",
        "aws-exec-read",
        "authenticated-read",
        "bucket-owner-read",
        "bucket-owner-full-control",
        "log-delivery-write",
      ],
      var.canned_acl
    )
    error_message = "The provider acl was not valid. Have you check the valid values?"
  }
}

variable "tags" {
  type        = map(string)
  description = "Tags to associate with all provisioned infrastructure"
}
