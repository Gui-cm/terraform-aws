data "aws_iam_role" "dynamodb_autoscaling_role" {
  name = "AWSServiceRoleForApplicationAutoScaling_DynamoDBTable"
}