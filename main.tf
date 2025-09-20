terraform {
  required_version = ">= 1.5.0"
}

# Dummy provider (local)
provider "null" {}

# A fake resource
resource "null_resource" "demo" {
  provisioner "local-exec" {
    command = "echo Hello from Terraform"
  }
}

# An output
output "greeting" {
  value = "Hello World from Terraform output!"
}
