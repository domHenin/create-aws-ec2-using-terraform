terraform {
  required_version = ">=0.12.0"
  backend "s3" {
    region  = "us-east-1"
    profile = "cloud_user"
    key     = "terrformstatefile"
    bucket  = "terrformstatebucket05170220"
  }
}