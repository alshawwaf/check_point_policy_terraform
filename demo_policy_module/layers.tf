resource "checkpoint_management_access_layer" "dns_layer" {
    name = "dns_layer"
    add_default_rule = false
    shared= true
    applications_and_url_filtering= true
    content_awareness= true
    mobile_access= false
    firewall= true
    implicit_cleanup_action= "drop"
    comments= "Test via Terraform"
    color= "red"
    tags= []
    ignore_warnings= false
    ignore_errors= false

}

