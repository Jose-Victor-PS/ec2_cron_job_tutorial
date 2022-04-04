output "tutorial_public_dns" {
  value = aws_instance.tutorial_machine.public_dns
}

output "tutorial_instance_id" {
  value = aws_instance.tutorial_machine.id
}