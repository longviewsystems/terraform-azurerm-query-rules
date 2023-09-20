/***************************************************************/
/*** Terratest only resources
/***************************************************************/
module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.3.0"
  suffix  = ["terratest"]
}

# Create a resource group for the test
resource "azurerm_resource_group" "terratest_rg" {
  name     = module.naming.resource_group.name_unique
  location = var.location
}

# Create an isolated Application Gateway and environments for the test to run in

resource "azurerm_virtual_network" "terratest_vnet" {
  name                = module.naming.virtual_network.name_unique
  resource_group_name = azurerm_resource_group.terratest_rg.name
  location            = var.location
  address_space       = ["10.254.0.0/16"]
}

resource "azurerm_subnet" "terratest_appg_frontend" {
  name                 = module.naming.subnet.name_unique
  resource_group_name  = azurerm_resource_group.terratest_rg.name
  virtual_network_name = azurerm_virtual_network.terratest_vnet.name
  address_prefixes     = ["10.254.0.0/24"]
}

resource "azurerm_subnet" "terratest_appg_backend" {
  name                 = module.naming.subnet.name_unique
  resource_group_name  = azurerm_resource_group.terratest_rg.name
  virtual_network_name = azurerm_virtual_network.terratest_vnet.name
  address_prefixes     = ["10.254.2.0/24"]
}

resource "azurerm_public_ip" "terratest_appg_public_ip" {
  name                = module.naming.public_ip.name_unique
  resource_group_name = azurerm_resource_group.terratest_rg.name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

# since these variables are re-used - a locals block makes this more maintainable
locals {
  backend_address_pool_name      = "${azurerm_virtual_network.terratest_vnet.name}-beap"
  frontend_port_name             = "${azurerm_virtual_network.terratest_vnet.name}-feport"
  frontend_ip_configuration_name = "${azurerm_virtual_network.terratest_vnet.name}-feip"
  http_setting_name              = "${azurerm_virtual_network.terratest_vnet.name}-be-htst"
  listener_name                  = "${azurerm_virtual_network.terratest_vnet.name}-httplstn"
  request_routing_rule_name      = "${azurerm_virtual_network.terratest_vnet.name}-rqrt"
}

resource "azurerm_application_gateway" "terratest_app_gateway" {
  name                = module.naming.application_gateway.name_unique
  resource_group_name = azurerm_resource_group.terratest_rg.name
  location            = var.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "terratest-gateway-ip-configuration"
    subnet_id = azurerm_subnet.terratest_appg_frontend.id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.terratest_appg_public_ip.id
  }

  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
    priority                   = 10
  }

  depends_on = [azurerm_virtual_network.terratest_vnet, azurerm_subnet.terratest_appg_frontend, azurerm_subnet.terratest_appg_backend]
}

/***************************************************************/
/*** Resources to be tested
/***************************************************************/
# Terraform module for creating an Azure Application Gateway firewall alert for unthorized access

resource "azurerm_monitor_action_group" "action_group" {
  name                = var.action_group_name
  resource_group_name = azurerm_resource_group.terratest_rg.name
  short_name          = "frewlalrt"

  email_receiver {
    name                    = "health-alert-email-receiver"
    email_address           = var.email_address
    use_common_alert_schema = false
  }

  tags = var.tags
}

resource "azurerm_monitor_scheduled_query_rules_alert" "custom_query_alert" {
  name                = "app-gateway-firewall-alerts-rule"
  location            = var.location
  resource_group_name = azurerm_resource_group.terratest_rg.name

  action {
    action_group  = [azurerm_monitor_action_group.action_group.id]
    email_subject = "Application Gateway Firewall Alert"
  }
  data_source_id = azurerm_application_gateway.terratest_app_gateway.id
  description    = "Alert when total results cross threshold"
  enabled        = true
  query = templatefile("${path.module}/templates/query.tftpl", {
    app_gateway_id = azurerm_application_gateway.terratest_app_gateway.id
  })
  severity    = var.alert_severity
  frequency   = var.alert_frequency
  time_window = var.alert_time_window
  trigger {
    operator  = "GreaterThan"
    threshold = var.trigger_threshold
  }
  tags = var.tags
}