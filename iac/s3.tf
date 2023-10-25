resource "aws_s3_bucket" "lahuen-dl-landing" {
  bucket = "lahuen-dl-landing"
  acl    = "private"

  versioning {
    enabled = false
  }
}

resource "aws_s3_bucket" "lahuen-dl-raw" {
  bucket = "lahuen-dl-raw"
  acl    = "private"

  versioning {
    enabled = false
  }
}

resource "aws_s3_bucket" "lahuen-dl-core" {
  bucket = "lahuen-dl-core"
  acl    = "private"

  versioning {
    enabled = false
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "landing" {
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }

  bucket = aws_s3_bucket.lahuen-dl-landing.id
}

resource "aws_s3_bucket_server_side_encryption_configuration" "raw" {
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }

  bucket = aws_s3_bucket.lahuen-dl-raw.id
}

resource "aws_s3_bucket_server_side_encryption_configuration" "core" {
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }

  bucket = aws_s3_bucket.lahuen-dl-core.id
}
