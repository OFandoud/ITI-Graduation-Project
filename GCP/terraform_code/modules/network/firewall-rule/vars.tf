# variable "name" {}
# variable "description" {}
# variable "source_ranges" {
#   type = list
# }
# variable "dirction" {}
# variable "allow_protocol_name" {}
# variable "allow_ports" {
#   type = list
# }
# variable "deny_protocol_name" {}
# variable "deny_ports" {
#   type = list
# }
# variable "vpc_id" {}
/*============================*/
variable "project_name" {
  description = "Project id of the project that holds the network."
}

variable "network_name" {
  description = "Name of the network this set of firewall rules applies to."
}

variable "rules" {
  description = "List of custom rule definitions (refer to variables file for syntax)."
  default     = []
  type = list(object({
    name                    = string
    description             = string
    direction               = string
    priority                = number
    ranges                  = list(string)
    
    
    allow = list(object({
      protocol = string
      ports    = list(string)
    }))
    deny = list(object({
      protocol = string
      ports    = list(string)
    }))
    
  }))
}