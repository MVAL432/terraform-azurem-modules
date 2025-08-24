module "rg" {
  source   = "git::https://github.com/MVAL432/terraform-azurem-modules.git//modules/resource_group?ref=master"
  name     = "rg-${var.project_name}"
  location = var.location
  tags     = var.tags
}

module "net" {
  source         = "git::https://github.com/MVAL432/terraform-azurem-modules.git//modules/network?ref=master"
  rg_name        = module.rg.name
  location       = module.rg.location
  vnet_name      = "vnet-${var.project_name}"
  address_space  = var.address_space
  subnet_name    = "snet-${var.project_name}"
  subnet_prefix  = var.subnet_prefix
  allow_ssh_cidr = var.allow_ssh_cidr
  tags           = var.tags
}

module "pip" {
  source   = "git::https://github.com/MVAL432/terraform-azurem-modules.git//modules/public_ip?ref=master"
  enabled  = var.create_public_ip
  rg_name  = module.rg.name
  location = module.rg.location
  name     = "pip-${var.project_name}"
  sku      = "Standard"
  tags     = var.tags
}

module "nic" {
  source                = "git::https://github.com/MVAL432/terraform-azurem-modules.git//modules/nic?ref=master"
  rg_name               = module.rg.name
  location              = module.rg.location
  name                  = "nic-${var.project_name}"
  subnet_id             = module.net.subnet_id
  public_ip_id          = module.pip.public_ip_id
  private_ip_allocation = "Dynamic"
  tags                  = var.tags
}

module "vm" {
  source         = "git::https://github.com/MVAL432/terraform-azurem-modules.git//modules/vm_linuxp?ref=master"
  rg_name        = module.rg.name
  location       = module.rg.location
  name           = "vm-${var.project_name}"
  size           = var.vm_size
  nic_ids        = [module.nic.nic_id]
  admin_username = var.admin_username
  admin_password = var.admin_password
  image = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  os_disk = {
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 64
    caching              = "ReadWrite"
  }
  tags = var.tags
}
