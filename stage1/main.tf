# Configure the VMware vCloud Director Provider
provider "vcd" {
    user            = "admin"
    org             = "myorg"
    url				= "https://api.mycloud.com/api"
    password        = "password123"
    maxRetryTimeout = 300
    vdc             = "My-VDC"
    version         = "0.1.1"
}