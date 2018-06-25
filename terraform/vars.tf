#ami for latest ubuntu 16.04LTS
#by adding variables to a single file makes the life easier to change in future
variable "ssh_key_id" {
  default = "openresty"
}

variable "ami" {
  default = "ami-41e9c52e"
}

#used free tier
variable "instance_type" {
  default = "t2.micro"
}

#incase of large disk utilization
variable "root_filesystem_size" {
  default = "24"
}
