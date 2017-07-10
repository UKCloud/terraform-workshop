# Configure the VMware vCloud Director Provider
provider "vcd" {
    maxRetryTimeout = 600
    vdc             = "${var.vdc}"
}

resource "vcd_network" "net" {
  name         = "terraform-workshop"
  edge_gateway = "${var.edge_gateway}"
  gateway      = "10.170.0.1"

  dhcp_pool {
    start_address = "10.170.0.2"
    end_address   = "10.170.0.100"
  }

  static_ip_pool {
    start_address = "10.170.0.152"
    end_address   = "10.170.0.254"
  }
}

resource "vcd_vapp" "web" {
  name          = "${var.vapp_name}"
  catalog_name  = "${var.catalog}"
  template_name = "${var.vapp_template}"
  memory        = 2048
  cpus          = 2

  network_name = "${vcd_network.net.name}"
  ip           = "10.170.0.180"

  metadata {
    role    = "web"
    env     = "staging"
    version = "v1"
  }
}