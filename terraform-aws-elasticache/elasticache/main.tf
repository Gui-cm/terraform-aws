terraform {
  # Optional attributes and the defaults function are
  # both experimental, so we must opt in to the experiment.
  experiments = [module_variable_optional_attrs]
}

resource "aws_elasticache_cluster" "elasticache" {
  cluster_id      = "${lookup(var.elasticache, "cluster_id")}-${lower(var.environment)}"
  engine          = lookup(var.elasticache, "engine")
  node_type       = lookup(var.elasticache, "node_type")
  num_cache_nodes = lookup(var.elasticache, "num_cache_nodes")
  security_group_ids = [aws_security_group.sg.id]
  availability_zone  = lookup(var.elasticache, "availability_zone")
  az_mode            = lookup(var.elasticache, "az_mode")
  snapshot_retention_limit = lookup(var.elasticache, "snapshot_retention_limit")
  snapshot_window          = lookup(var.elasticache, "snapshot_window")
  maintenance_window       = lookup(var.elasticache, "maintenance_window")
  port                     = lookup(var.elasticache, "port")
  subnet_group_name        = aws_elasticache_subnet_group.subnetgroup.name

}

resource "aws_security_group" "sg" {
  name        = "${lookup(lookup(var.elasticache, "security_group"), "name")}-${upper(var.environment)}"
  description = lookup(lookup(var.elasticache, "security_group"), "description")
  vpc_id      = var.vpc

  dynamic "ingress" {
    for_each = lookup(lookup(var.elasticache, "security_group"), "ingress")
    content {
      from_port   = lookup(ingress.value, "from")
      to_port     = lookup(ingress.value, "to")
      protocol    = lookup(ingress.value, "protocol")
      cidr_blocks     = lookup(ingress.value, "cidr_blocks")
      security_groups = lookup(ingress.value, "security_groups")
    }

  }

}

resource "aws_elasticache_subnet_group" "subnetgroup" {
  name       = lookup(lookup(var.elasticache, "subnet_group"), "name")
  subnet_ids = lookup(lookup(var.elasticache, "subnet_group"), "subnet_ids")

}
