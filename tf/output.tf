output "instance_arn" {
  value = aws_instance.ec2_ubuntu_instance.arn
}

output "public_instance_ip" {
  value = aws_instance.ec2_ubuntu_instance.public_ip
}

output "private_instance_ip" {
  value = aws_instance.ec2_ubuntu_instance.private_ip
}

# output "tf_state_bucket_arn" {
#   value = aws_s3_bucket.tf_state_bucket.arn
# }

# output "tf_state_bucket_id" {
#   value = aws_s3_bucket.tf_state_bucket.id
# }

# output "tf_bucket_key_arn" {
#   value = aws_kms_key.tf_bucket_key.arn
# }

# output "aws_dynamodb_table_arn" {
#   value = aws_dynamodb_table.tf_state_lock.arn
# }
