provider "docker" {}
provider "random" {}

resource "random_integer" "port" {
  min = 8000
  max = 8099
}

locals {
  host_lb_port = (var.k3d_host_lb_port != "" ? var.k3d_host_lb_port : random_integer.port.result)
}

resource "null_resource" "cluster" {
  triggers = {
    agent_count  = var.agent_count
    server_count = var.server_count
    port         = var.k3d_cluster_port
  }
  provisioner "local-exec" {
    command = "k3d cluster create ${var.k3d_cluster_name} --api-port ${var.k3d_cluster_port} --servers ${var.server_count} --agents ${var.agent_count} --port ${var.k3d_host_lb_port}:${var.k3d_cluster_lb_port}@loadbalancer"
  }
}

resource "null_resource" "cluster_delete" {
  for_each = toset(var.k3d_cluster_name)
  provisioner "local-exec" {
    command = "k3d cluster delete ${each.key}"
    when    = destroy
  }
}

data "docker_network" "k3d" {
  for_each = toset(var.k3d_cluster_name)
  depends_on = [
    null_resource.cluster
  ]
  name = "k3d-${each.key}"
}
