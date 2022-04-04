variable "instance_size" {
  type = map(string)

  default = {
    "test" = "t2.micro"
    "prod" = "t2.medium"
  }
}

variable "network" {
  type = object({
    all_ipv4 = string
    all_ipv6 = string
    all_protocols = string
    all_ports = number
  })

  default = {
    all_ipv4 = "0.0.0.0/0"
    all_ipv6 = "::/0"
    all_protocols = "-1"
    all_ports = 0
  }
}

variable "disk" {
  type = map(number)

  default = {
    "test" = 16
    "prod" = 64
  }
}

variable "ssh_key" {
  type = string
  default = "carteira"
}

variable "inbound_rules" {
  type = object({
    port = number
    protocol = string
    description = string
  })

  default = {
    port = 22,
    protocol = "tcp",
    description = "Allow SSH"
  }
}