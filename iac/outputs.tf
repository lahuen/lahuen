output "owner_id" {
  value = data.aws_caller_identity.current.account_id
}

output "lahuen_dl_bucket_landing" {
  value = aws_s3_bucket.lahuen-dl-landing.bucket
}

output "lahuen_dl_bucket_raw" {
  value = aws_s3_bucket.lahuen-dl-raw.bucket
}

output "lahuen_dl_bucket_core" {
  value = aws_s3_bucket.lahuen-dl-core.bucket
}
