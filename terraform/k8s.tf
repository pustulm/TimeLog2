resource "kubernetes_namespace" "Timelog2" {
  metadata {
    name = "timelog2"
  }
}

resource "kubernetes_deployment" "Timelog2" {
  metadata {
    name = "terraform-example"
    labels = {
      test = "TimeLog2"
    }
    namespace = "Timelog2"
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
          name  = "michalp96/timelog2:latest"

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

resource "kubernetes_service" "Timelog2" {
  metadata {
    name = "timelog2-service"
  }
  spec {
    selector = {
      app = "timelog2"
    }
    port {
      port        = 80
      target_port = 3000
    }

    type = "LoadBalancer"
  }
}
