project_name     = "springboot-project"
location         = "eastus"
address_space    = ["10.0.0.0/16"]
subnet_prefix    = ["10.0.1.0/24"]
admin_username   = "azureadmin"
admin_password   = "Welcome@123456" # Use a strong password meeting Azure policy
vm_size          = "Standard_B2s"
create_public_ip = true
allow_ssh_cidr   = "0.0.0.0/0" # tighten for prod
tags = {
  project = "springboot_project"
  env     = "dev"
  owner   = "Anand Lokesh"
}
