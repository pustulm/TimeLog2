resource "kubernetes_namespace" "timelog2test" {
    metadata {
        name = "timelog2test"
    }
}

resource "kubernetes_deployment" "timelog2" {
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

resource "kubernetes_service" "timelog2svc" {
  metadata {
    name = "timelog2svc"
  }
  spec {
    selector = {
      app = kubernetes_deployment.timelog2.spec.0.template.0.metadata.0.labels.app
    }
    port {
      port        = 80
      target_port = 3000
    }

    type = "LoadBalancer"
  }
}
