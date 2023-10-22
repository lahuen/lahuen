terraform {
  backend "s3" {
    bucket         = "lahuen-tf"
    key            = "data/lahuen.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "lahuen-tf"
  }
}
