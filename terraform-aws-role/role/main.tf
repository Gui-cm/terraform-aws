terraform {
  # Optional attributes and the defaults function are
  # both experimental, so we must opt in to the experiment.
  experiments = [module_variable_optional_attrs]
}

resource "aws_iam_role" "role" {
  name                 = lookup(var.role, "name")
  assume_role_policy   = data.aws_iam_policy_document.role.json
  managed_policy_arns  = lookup(var.role, "managed_policy_arns")
  max_session_duration = lookup(var.role, "max_session_duration")
  tags                 = lookup(var.role, "tags")
}



resource "aws_iam_policy" "policy" {
  for_each = lookup(var.role, "policies")
  name     = lookup(each.value, "name")
  policy = jsonencode({
    Statement = lookup(each.value, "statement")
    Version   = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  for_each   = aws_iam_policy.policy
  role       = lookup(aws_iam_role.role, "name")
  policy_arn = lookup(each.value, "arn")
}
