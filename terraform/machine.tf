resource "aws_instance" "tutorial_machine" {
  ami = data.aws_ami.amazon_linux.id
  instance_type = var.instance_size.test
  key_name = var.ssh_key
  security_groups = [aws_security_group.tutorial_sg.name]
  root_block_device {
    volume_size = var.disk.test
  }
  tags = {
    Name = "my_tutorial_machine"
  }
}

resource "aws_security_group" "tutorial_sg" {
  name = "tutorial_sg"
  description = "Tutorial Security Group"

  ingress { #Inbound Rule
    from_port = var.inbound_rules.port
    protocol = var.inbound_rules.protocol
    to_port = var.inbound_rules.port
    cidr_blocks = [var.network.all_ipv4]
    ipv6_cidr_blocks = [var.network.all_ipv6]
    description = var.inbound_rules.description
  }

  egress { # Outbond Rule
    from_port = var.network.all_ports
    protocol = var.network.all_protocols
    to_port = var.network.all_ports
    cidr_blocks = [var.network.all_ipv4]
    ipv6_cidr_blocks = [var.network.all_ipv6]
  }

  tags = {
    Name = "Allow SSH Only"
  }

}
