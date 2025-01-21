
data "azurerm_public_ip" "default" {
    name                = azurerm_public_ip.default.name
    resource_group_name = azurerm_resource_group.default.name
    id          = azurerm_public_ip.default.id
}

output "azurerm_public_ip" {
    value = {
        name       = data.azurerm_public_ip.default.name
        ip_address = data.azurerm_public_ip.default.id
    }  
}
