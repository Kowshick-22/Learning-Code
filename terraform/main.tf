# Main Terraform configuration
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = ">= 2.0.0"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.0.0"
    }
  }
}

# Example: Create a local file
resource "local_file" "example" {
  content  = "Hello, Terraform local!"
  filename = "Salary.csv"
}

# Simulate a table by creating a CSV file
resource "local_file" "table_bq" {
  content  = <<EOT
[
  {
    "name": "id",
    "type": "STRING",
    "mode": "REQUIRED",
    "description": "Unique identifier"
  },
  {
    "name": "name",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "Name of the person"
  },
  {
    "name": "age",
    "type": "INTEGER",
    "mode": "NULLABLE",
    "description": "Age of the person"
  },
  {
    "name": "joining_date",
    "type": "DATE",
    "mode": "NULLABLE",
    "description": "Date of joining"
  },
  {
    "name": "Salary",
    "type": "INTEGER",
    "mode": "NULLABLE",
    "description": "Salary of the person"
  }
]
EOT
  filename = "table_bq_schema.json"
}

## null_resource removed to avoid local-exec error on Windows