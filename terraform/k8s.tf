resource "kubernetes_deployment" "example" {
  metadata {
    name = "terraform-example"
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
          image = "michalp96/timelog2"
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
