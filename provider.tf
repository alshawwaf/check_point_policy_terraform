terraform {
  required_providers {
    checkpoint = {
      source = "CheckPointSW/checkpoint"
      version = "2.9.0"
    }
  }
}


provider "checkpoint" {
	server = "10.0.1.100"
	username = "admin"
	password = "Cpwins!1"
	context = "web_api"
	timeout = "30"
    session_description = "TF Policy"
    
}

