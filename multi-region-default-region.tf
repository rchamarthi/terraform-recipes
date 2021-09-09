# AWS credentials along with default region exported in the current terminal session
# Module code requires accessing resources from both the current default region and a new region where some central resources are created

provider "aws" {    
  region = "us-west-2"
  alias  = "us-west-2"
}

data "aws_dynamodb_table" "tableName-us-west-2" {
  name = "us-west-2-table"
  provider = aws.us-west-2
}

data "aws_dynamodb_table" "tableName-us-east-1" {
  name = "table-us-east-1"
}

output ddb-us-west-2  {
  value = data.aws_dynamodb_table.tableName-us-west-2.arn
}

output ddb-us-east-1  {
  value = data.aws_dynamodb_table.tableName-us-east-1.arn
}

# output of terraform plan

Changes to Outputs:
  + ddb-us-east-1 = "arn:aws:dynamodb:us-east-1:123456789:table/table-us-east-1"
  + ddb-us-west-2 = "arn:aws:dynamodb:us-west-2:123456789:table/us-west-2-table"
