#S3 resources 
resource "aws_s3_bucket" "private_bucket" {
  bucket = "demo-private-s3-bucket"
  acl    = "private"
  tags = {
    Name        = "zero-touch-private-s3-bucket"
  }
}
resource "aws_s3_bucket" "public_bucket" {
  bucket = "demo-public-s3-bucket"
  acl    = "public-read"
  tags = {
    Name        = "zero-touch-public-s3-bucket"
  }
}
