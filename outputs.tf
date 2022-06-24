output "connection_string" {
    value = azurerm_storage_account.storage_account.primary_connection_string
    depends_on = [azurerm_storage_account]
}