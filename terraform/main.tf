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
        app = "swiggy-app"
    }
}

resource "azurerm_virtual_machine_extension" "default" {
    name                 = "customScript"
    virtual_machine_id   = azurerm_virtual_machine.default.id
    publisher            = "Microsoft.Azure.Extensions"
    type                 = "CustomScript"
    type_handler_version = "2.0"
    settings = <<SETTINGS
        {
            "script": "./inline-script.sh"
        }
SETTINGS
  
}


resource "azurerm_network_interface" "default" {
  name                      = "swiggy-app-nic"
  location                  = azurerm_resource_group.default.location
  resource_group_name       = azurerm_resource_group.default.name
  ip_configuration {
      name                          = "internal"
      subnet_id                     = azurerm_subnet.default.id
      private_ip_address_allocation = "Dynamic"
  }
  
}

resource "azurerm_subnet" "default" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.default.name
  virtual_network_name = azurerm_virtual_network.default.name
  address_prefixes     = ["192.168.0.0/24"]
}