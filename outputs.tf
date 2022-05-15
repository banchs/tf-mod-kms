output "kms_id" {
  value = aws_kms_key.key.key_id
}

output "kms_arn" {
  value = aws_kms_key.key.arn
}

output "kms_alias" {
  value = aws_kms_alias.key_alias.arn
}

