variable "bucket_name" {
  type   = string
}
variable "tags" {
  type = map(any)
  default = {}
}

variable "S3_kms_master_key_id" {
  type = string
  default = null
}

variable "s3_bucket_versioning" {
  type = string
  default = "Enabled"
}
variable "s3_bucket_acl" {
  type = string
  default = ""
}