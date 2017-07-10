variable "vdc" {
	default = "A-ESS-Bobby Demo VDC"
}

variable "edge_gateway" {
	default = "Internet_01(nti0000bi2_467-735-2)"
}

variable "vapp_name" {
	default = "bobby_terraform-workshop"
}

variable "catalog" { 
	default = "Skyscape Catalogue" 
}
variable "vapp_template" {
	default = "Skyscape_CentOS_7_3_x64_60GB_Small_V1.0.0"
}

variable "network_ip_pool" {
	default = "10.170.0.0/24"
}
