output "id" {
  value = data.aws_ami.latest.id
}

output "user" {
  value = local.os_map[var.os_name]["user"]
}
