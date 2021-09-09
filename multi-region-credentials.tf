# With the credentials exported in the region

provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"
}

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
  provider = aws.us-east-1
}

output ddb-us-west-2    {
  value = data.aws_dynamodb_table.tableName-us-west-2.arn
}

output ddb-us-east-1    {
  value = data.aws_dynamodb_table.tableName-us-east-1.arn
}

#### Terraform plan output

Changes to Outputs:
  + ddb-us-east-1 = "arn:aws:dynamodb:us-east-1:0123456789:table/table-us-east-1"
  + ddb-us-west-2 = "arn:aws:dynamodb:us-west-2:0123456789:table/us-west-2-table"
