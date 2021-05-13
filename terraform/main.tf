provider "docker" {}
provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "null_resource" "cluster" {
  provisioner "local-exec" {
    command = "k3d cluster create ${var.k3d_cluster_name}"
  }
}

resource "null_resource" "cluster_delete" {
  triggers = {
    k3d_cluster_name = var.k3d_cluster_name
  }
  provisioner "local-exec" {
    command = "k3d cluster delete ${self.triggers.k3d_cluster_name}"
    when    = destroy
  }
}

data "docker_network" "k3d" {
  depends_on = [
    null_resource.cluster
  ]
  name = "k3d-${var.k3d_cluster_name}"
}

