resource "kubernetes_namespace" "timelog2" {
    metadata {
        name = "timelog2"
    }
}

resource "kubernetes_deployment" "example" {
  metadata {
    name = "terraform-timelog2"
    labels = {
      test = "MyTimeLog2"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        test = "TimeLog2"
      }
    }

    template {
      metadata {
        labels = {
          test = "TimeLog2"
        }
      }

      spec {
        container {
          image = "michalp96/timelog2:latest"
          name  = "timelog2"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
          port {
            container_port = 3000
          }
        }
      }
    }
  }
}
