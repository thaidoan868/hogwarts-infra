output "output" {
  description = "Who am I according to AWS STS?"
  value = {
    account_id = data.aws_caller_identity.me.account_id
    arn        = data.aws_caller_identity.me.arn
    user_id    = data.aws_caller_identity.me.user_id
    checked_at = local.now_utc
  }
}