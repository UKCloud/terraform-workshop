# Configure the VMware vCloud Director Provider
provider "vcd" {
    maxRetryTimeout = 600
    vdc             = "${var.vdc}"
    version.        = "0.1.1"
}

resource "vcd_network" "net" {
  name         = "terraform-workshop"
  edge_gateway = "${var.edge_gateway}"
  gateway      = "${cidrhost(var.network_ip_pool, 1)}"

  dhcp_pool {
    start_address = "${cidrhost(var.network_ip_pool, 2)}"
    end_address   = "${cidrhost(var.network_ip_pool, 100)}"
  }

  static_ip_pool {
    start_address = "${cidrhost(var.network_ip_pool, 152)}"
    end_address   = "${cidrhost(var.network_ip_pool, 254)}"
  }
}


resource "vcd_vapp" "webble" {
  name          = "bobby_new_web_app1_june16_1"
}

resource "vcd_vapp_vm" "web1" {
  vapp_name     = "${vcd_vapp.webble.name}"
  name          = "bobby_new_web_vm1_July10_1"
  catalog_name  = "Skyscape Catalogue"
  template_name = "Skyscape_CentOS_7_3_x64_60GB_Small_V1.0.0"
  memory        = 4096
  cpus          = 2

  network_name = "${vcd_network.net.name}"
}

