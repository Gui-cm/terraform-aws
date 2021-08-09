data "aws_iam_policy_document" "role" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = lookup(lookup(var.role, "principal"), "type")
      identifiers = lookup(lookup(var.role, "principal"), "identifiers")
    }
  }
}


