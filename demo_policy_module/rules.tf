resource "checkpoint_management_access_rule" "rule1" {
  layer = "${checkpoint_management_package.R81_terraform_Demo.name} Network"
  position = {top = "top"}
  name = "Rule 1"
  source = [checkpoint_management_host.host1.name]
  enabled = true
  destination = [checkpoint_management_network.network1.name]
  destination_negate = false
  service = [checkpoint_management_service_tcp.service1.name, checkpoint_management_service_udp.service1.name]
  service_negate = false
  action = "Accept"
  action_settings = {
    enable_identity_captive_portal = false
  }
  track = {
    accounting = true
	alert = "none"
    enable_firewall_session = true
    per_connection = true
    per_session = true
    type = "Log"
  }
}

resource "checkpoint_management_access_rule" "rule2" {
  layer = "${checkpoint_management_package.R81_terraform_Demo.name} Network"
  position = {below = checkpoint_management_access_rule.rule1.id}
  name = "Rule 2"
  source = [checkpoint_management_host.host2.name]
  enabled = true
  destination = [checkpoint_management_network.network2.name]
  destination_negate = false
  service = [checkpoint_management_service_tcp.service2.name, checkpoint_management_service_udp.service2.name]
  service_negate = false
  action = "Accept"
  action_settings = {
    enable_identity_captive_portal = false
  }
  track = {
    accounting = true
	alert = "none"
    enable_firewall_session = true
    per_connection = true
    per_session = true
    type = "Log"
  }
}

resource "checkpoint_management_access_rule" "rule3" {
  layer = "${checkpoint_management_package.R81_terraform_Demo.name} Network"
  position = {below = checkpoint_management_access_rule.rule2.id}
  name = "Rule 3"
  source = [checkpoint_management_host.host3.name]
  enabled = true
  destination = [checkpoint_management_network.network3.name]
  destination_negate = false
  service = [checkpoint_management_service_tcp.service3.name, checkpoint_management_service_udp.service3.name]
  service_negate = false
  action = "Accept"
  action_settings = {
    enable_identity_captive_portal = false
  }
  track = {
    accounting = true
	alert = "none"
    enable_firewall_session = true
    per_connection = true
    per_session = true
    type = "Log"
  }
}

resource "checkpoint_management_access_rule" "rule4" {
  layer = "${checkpoint_management_package.R81_terraform_Demo.name} Network"
  position = {below = checkpoint_management_access_rule.rule3.id}
  name = "Rule 4"
  source = [checkpoint_management_host.host4.name]
  enabled = true
  destination = [checkpoint_management_network.network4.name]
  destination_negate = false
  service = [checkpoint_management_service_tcp.service4.name, checkpoint_management_service_udp.service4.name]
  service_negate = false
  action = "Accept"
  action_settings = {
    enable_identity_captive_portal = false
  }
  track = {
    accounting = true
	alert = "none"
    enable_firewall_session = true
    per_connection = true
    per_session = true
    type = "Log"
  }
}

resource "checkpoint_management_access_rule" "rule5" {
  layer = "${checkpoint_management_package.R81_terraform_Demo.name} Network"
  position = {below = checkpoint_management_access_rule.rule4.id}
  name = "Rule 5"
  source = ["network1", "network2"]
  enabled = true
  destination = ["any"]
  destination_negate = false
  service = ["DNS"]
  service_negate = false
  action = "Apply Layer"
  inline_layer = checkpoint_management_access_layer.dns_layer.name
  track = {
    accounting = true
	alert = "none"
    enable_firewall_session = true
    per_connection = true
    per_session = true
    type = "Log"
  }
}

resource "checkpoint_management_access_rule" "inline_rule1" {
  layer = checkpoint_management_access_layer.dns_layer.name
  position = {top = "top"}
  name = "Inline Rule 1"
  source = [checkpoint_management_host.host5.name, checkpoint_management_host.host4.name, checkpoint_management_host.host3.name, checkpoint_management_host.host2.name, checkpoint_management_host.host1.name ]
  enabled = true
  destination = ["any"]
  destination_negate = false
  service = ["any"]
  service_negate = false
  action = "Accept"
  action_settings = {
    enable_identity_captive_portal = false
  }
  track = {
    accounting = true
	alert = "none"
    enable_firewall_session = true
    per_connection = true
    per_session = true
    type = "Log"
  }
}

resource "checkpoint_management_access_rule" "inline_cleanup" {
  layer = checkpoint_management_access_layer.dns_layer.name
  position = {bottom = "bottom"}
  name = "Inline Cleanup"
  source = ["any"]
  enabled = true
  destination = ["any"]
  destination_negate = false
  service = ["any"]
  service_negate = false
  action = "Drop"
  track = {
    accounting = true
	  alert = "none"
    enable_firewall_session = true
    per_connection = true
    per_session = true
    type = "Log"
  }
}