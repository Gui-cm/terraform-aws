role_arn = "arn:aws:iam::Account-ID:role/Role-Admin"

dynamodb = {
  tabela1 = {
    name     = "TABLENAME"
    hash_key = "Id"
    billing_mode   = "PROVISIONED"
    read_capacity  = 5
    write_capacity = 5

    attribute = [{
      name = "Id"
      type = "S"
    }]
  }


  tabela2 = {
    name     = "TABLENAME"
    hash_key = "Id"
    billing_mode   = "PROVISIONED"
    read_capacity  = 5
    write_capacity = 5

    global_secondary_index = [{
      hash_key        = "Chave"
      attribute_type  = "S"
      name            = "Chave-index"
      projection_type = "ALL"
      read_capacity   = 20
      write_capacity  = 25
    }]

    attribute = [
      {
        name = "Id"
        type = "S"
      },
      {
        name = "Chave"
        type = "S"
      }
    ]
  }

}

dynamodb_asg = {
  asg1 = {
    max_capacity       = 40000
    min_capacity       = 5
    resource_id        = "table/TABLENAME"
    scalable_dimension = "dynamodb:table:ReadCapacityUnits"
    service_namespace  = "dynamodb"
  }

  asg2 = {
    max_capacity       = 40000
    min_capacity       = 5
    resource_id        = "table/TABLENAME"
    scalable_dimension = "dynamodb:table:WriteCapacityUnits"
    service_namespace  = "dynamodb"
  },

}
