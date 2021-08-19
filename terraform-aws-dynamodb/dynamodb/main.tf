terraform {
  # Optional attributes and the defaults function are
  # both experimental, so we must opt in to the experiment.
  experiments = [module_variable_optional_attrs]
}

resource "aws_dynamodb_table" "dynamodb" {
  for_each       = var.dynamodb
  name           = lookup(each.value, "name")  
  hash_key       = lookup(each.value, "hash_key")
  billing_mode   = lookup(each.value, "billing_mode", "PAY_PER_REQUEST")
  read_capacity  = lookup(each.value, "read_capacity", null)
  write_capacity = lookup(each.value, "write_capacity", null)

  dynamic "attribute" {
    for_each = lookup(each.value, "attribute")
    content {
      name = lookup(attribute.value, "name")
      type = lookup(attribute.value, "type")
    }
  }

  dynamic "global_secondary_index" {
    for_each = lookup(each.value, "global_secondary_index") == null ? [] : lookup(each.value, "global_secondary_index")
    content {
      hash_key        = lookup(global_secondary_index.value, "hash_key")
      name               = lookup(global_secondary_index.value, "name")
      projection_type = lookup(global_secondary_index.value, "projection_type")
      read_capacity   = lookup(global_secondary_index.value, "read_capacity")
      write_capacity  = lookup(global_secondary_index.value, "write_capacity")
    }
  }

  point_in_time_recovery {
    enabled = true
  }

  timeouts {}

  ttl {
    attribute_name = ""
    enabled        = false
  }

  tags = lookup(each.value, "tags", {})
}

resource "aws_appautoscaling_target" "dynamodb_asg" {
  for_each           = var.dynamodb_asg
  max_capacity       = lookup(each.value, "max_capacity", null)
  min_capacity       = lookup(each.value, "min_capacity", null)
  resource_id        = lookup(each.value, "resource_id")
  scalable_dimension = lookup(each.value, "scalable_dimension")
  service_namespace  = lookup(each.value, "service_namespace")
  role_arn           = data.aws_iam_role.dynamodb_autoscaling_role.arn

  depends_on = [
    aws_dynamodb_table.dynamodb
  ]
}

resource "aws_appautoscaling_policy" "dynamo_asg_policy" {
  for_each           = aws_appautoscaling_target.dynamodb_asg
  name               = "${can(regex(".*Read.*", lookup(each.value, "scalable_dimension"))) ? "DynamoDBReadCapacityUtilization" : "DynamoDBWriteCapacityUtilization"}:${lookup(each.value, "resource_id")}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = lookup(each.value, "resource_id")
  scalable_dimension = lookup(each.value, "scalable_dimension")
  service_namespace  = lookup(each.value, "service_namespace")

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = can(regex(".*Read.*", lookup(each.value, "scalable_dimension"))) ? "DynamoDBReadCapacityUtilization" : "DynamoDBWriteCapacityUtilization"
    }
    target_value = var.target_asg
  }
}