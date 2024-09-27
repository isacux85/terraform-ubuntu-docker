variable "master_tags" {
  default = ["ubuntu-instance"]
}

variable "master_count" {
  default = 1
}

variable "api_url" {
  type = string
}

variable "api_key" {
  type = string
}

variable "secret_key" {
  type = string
}

#en las siguientes variables van los valores que tiene tu nube y como los configuraste
variable "cloud-tu-nube" {
  description = ""
  default = {
    zone_name = "**************"
    template_name = "***********"
    node_type = "************"
    network_id = "************"
  }
}
