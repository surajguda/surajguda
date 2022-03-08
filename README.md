### AWS DynamoDB Table Terraform module Terraform module to create a DynamoDB table.

```
module "dynamodb_table" {
source              = "../dynamodb"
hash_key		    = var.hash_key
name			    = var.name
stream_view_type	= var.stream_view_type
billing_mode		= var.billing_mode
attribute_name 		= var.attribute_name
}
```

Note
: Creating DynamoDB tables for re-usability, in example file an example is mentioned to create DynamoDB tables.
