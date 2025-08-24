resource "azurerm_linux_virtual_machine" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  size                = var.size
  network_interface_ids = var.nic_ids
  tags                = var.tags

  admin_username                  = var.admin_username
  disable_password_authentication = false
  admin_password                  = var.admin_password

  source_image_reference {
    publisher = var.image.publisher
    offer     = var.image.offer
    sku       = var.image.sku
    version   = var.image.version
  }

  os_disk {
    caching              = var.os_disk.caching
    storage_account_type = var.os_disk.storage_account_type
    disk_size_gb         = var.os_disk.disk_size_gb
  }

  boot_diagnostics {}
}
