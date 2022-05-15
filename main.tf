data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "this" {
  statement {
    sid = "kms"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]

    }
    actions   = ["kms:*"]
    resources = ["*"]
  }
  statement {
    sid = "Allow access for Key Administrators"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/gbanchs"]

    }
    actions = [
      "kms:Create*",
      "kms:Describe*",
      "kms:Enable*",
      "kms:List*",
      "kms:Put*",
      "kms:Update*",
      "kms:Revoke*",
      "kms:Disable*",
      "kms:Get*",
      "kms:Delete*",
      "kms:TagResource",
      "kms:UntagResource",
      "kms:ScheduleKeyDeletion",
      "kms:CancelKeyDeletion"
    ]
    resources = ["*"]
  }
}
resource "aws_kms_key" "key" {
  description             = "KMS key for environment ${var.env}"
  deletion_window_in_days = 30
  tags                    = var.tags
  policy                  = data.aws_iam_policy_document.this.json
}

resource "aws_kms_alias" "key_alias" {
  name          = "alias/${var.name}-${var.env}"
  target_key_id = aws_kms_key.key.id
}
