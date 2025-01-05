resource "azurerm_virtual_machine" "default" {
  name                  = "swiggy-app-vm"
  location              = azurerm_resource_group.default.location
  resource_group_name   = azurerm_resource_group.default.name
  network_interface_ids = [azurerm_network_interface.default.id]
    vm_size               = "Standard_B2s"
    delete_os_disk_on_termination = true
    delete_data_disks_on_termination = true
    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04-LTS"
        version   = "latest"
    }
    storage_os_disk {
        name              = "myosdisk1"
        caching           = "ReadWrite"
        create_option     = "FromImage"
    }
    os_profile {
        computer_name  = "swiggy-app-vm"
        admin_username = var.VM_ADMIN_USERNAME
        admin_password = var.VM_ADMIN_PASSWORD
    }
    os_profile_linux_config {
        disable_password_authentication = false
    }
    tags = {
        environment = "staging"
    }
}
