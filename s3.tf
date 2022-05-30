resource "aws_s3_bucket" "artefacts" {
  #checkov:skip=CKV_AWS_145:Using default S3 enc
  #checkov:skip=CKV_AWS_144:Bucket objects can be rebuilt if necessary
  #checkov:skip=CKV_AWS_21:Bucket objects are final once built
  #checkov:skip=CKV_AWS_18:No access logging is fine
  bucket = var.bucket_name
  tags   = var.tags
}

resource "aws_s3_bucket_acl" "artefacts" {
  bucket = aws_s3_bucket.artefacts.id
  acl    = var.canned_acl
}

resource "aws_s3_bucket_public_access_block" "artefacts" {
  bucket                  = aws_s3_bucket.artefacts.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "artefacts" {
  bucket = aws_s3_bucket.artefacts.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
