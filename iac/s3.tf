resource "aws_s3_bucket" "lahuen-dl-landing" {
  bucket = "lahuen-dl-landing"
}

resource "aws_s3_bucket_acl" "landing" {
  bucket = aws_s3_bucket.lahuen-dl-landing.id
}

resource "aws_s3_bucket_public_access_block" "landing" {
  bucket = aws_s3_bucket.lahuen-dl-landing.id

  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "landing" {
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }

  bucket = aws_s3_bucket.lahuen-dl-landing.id
}

# resource "aws_s3_bucket_versioning" "landing" {
#   bucket = aws_s3_bucket.lahuen-dl-landing.id
# }

resource "aws_s3_bucket" "lahuen-dl-raw" {
  bucket = "lahuen-dl-raw"
}

resource "aws_s3_bucket_acl" "raw" {
  bucket = aws_s3_bucket.lahuen-dl-raw.id
}

resource "aws_s3_bucket_public_access_block" "raw" {
  bucket = aws_s3_bucket.lahuen-dl-raw.id

  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "raw" {
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }

  bucket = aws_s3_bucket.lahuen-dl-raw.id
}

# resource "aws_s3_bucket_versioning" "raw" {
#   bucket = aws_s3_bucket.lahuen-dl-raw.id
# }

resource "aws_s3_bucket" "lahuen-dl-core" {
  bucket = "lahuen-dl-core"
  acl    = "private"

  versioning {
    enabled = false
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "core" {
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }

  bucket = aws_s3_bucket.lahuen-dl-core.id
}
