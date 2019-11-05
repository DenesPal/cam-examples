variable "catalog_name" {
    type = "string"
    default = "CTL-Golden-Images"
}
variable "linux_template" {
    type = "string"
    default = "ubuntu-16_04-20190815-1600"
}
variable "windows_template" {
    type = "string"
    default = "WIN2012R2DTC-64-20190715-1800"
}
variable "network_name" {
    type = "string"
    default = "s632835-network-0"
}
variable "memory" {
    type = "string"
    default = 1024
}
