output "lahuen_dl_bucket_names" {
  value = aws_s3_bucket.lahuen_dl.*.bucket
}
