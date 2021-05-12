variable "k3d_cluster_name" {
  default = ["k3d"]
  type    = list(string)
}

variable "k3d_cluster_port" {
  default = 6550
  type    = number
}

variable "k3d_host_lb_port" {
  default = null
  type    = number
}

variable "k3d_cluster_lb_port" {
  default = 80
  type    = number
}

variable "server_count" {
  default = 1
  type    = number
}

variable "agent_count" {
  default = 0
  type    = number
}
