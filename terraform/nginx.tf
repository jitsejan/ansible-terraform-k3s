resource "kubernetes_namespace" "test" {
  metadata {
    name = "nginx"
  }
}
resource "kubernetes_ingress" "example_ingress" {
  metadata {
    name      = "example-ingress"
    namespace = kubernetes_namespace.test.metadata.0.name
  }

  spec {
    backend {
      service_name = "app1"
      service_port = 8080
    }

    rule {
      http {
        path {
          backend {
            service_name = "app1"
            service_port = 8080
          }

          path = "/app1/*"
        }

        path {
          backend {
            service_name = "app2"
            service_port = 8080
          }

          path = "/app2/*"
        }
      }
    }

    tls {
      secret_name = "tls-secret"
    }
  }
}

resource "kubernetes_pod" "example" {
  metadata {
    name      = "terraform-example"
    namespace = kubernetes_namespace.test.metadata.0.name
    labels = {
      app = "MyApp1"
    }
  }

  spec {
    container {
      image = "nginx:1.7.9"
      name  = "example"

      port {
        container_port = 8080
      }
    }
  }
}

resource "kubernetes_pod" "example2" {
  metadata {
    name      = "terraform-example2"
    namespace = kubernetes_namespace.test.metadata.0.name
    labels = {
      app = "MyApp2"
    }
  }

  spec {
    container {
      image = "nginx:1.7.9"
      name  = "example"

      port {
        container_port = 8080
      }
    }
  }
}