# S3 outputs
output private_bucket_name {
	value = aws_s3_bucket.private_bucket.id
}
output public_bucket_name {
	value = aws_s3_bucket.public_bucket.id
}
