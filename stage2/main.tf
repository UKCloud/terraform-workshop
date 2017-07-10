variable "vcd_org" {
  default = "org"
}
variable "vcd_userid" {
  default = "userid"
}
variable "vcd_pass" {
  default = "password"
}
variable "vcd_url" { default = "https://api.vcd.pod0000b.sys00005.portal.skyscapecloud.com/api" }

# Configure the VMware vCloud Director Provider
provider "vcd" {
    user            = "${var.vcd_userid}"
    org             = "${var.vcd_org}"
    url             = "${var.vcd_url}"
    password        = "${var.vcd_pass}"
    maxRetryTimeout = 600
    vdc             = "A-ESS-Bobby Demo VDC"
    version         = "0.1.1"
}

