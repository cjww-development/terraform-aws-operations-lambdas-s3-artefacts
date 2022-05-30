output "bucket_arn" {
  value       = aws_s3_bucket.artefacts.arn
  description = "The ARN of the created S3 bucket"
}
