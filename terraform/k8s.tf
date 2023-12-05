resource "kubernetes_namespace" "timelog2test" {
    metadata {
        name = "timelog2test"
    }
}

resource "kubernetes_deployment" "timelog2" {
  metadata {
    name = "terraform-timelog2"
    labels = {
      app = "timeLog2"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "TimeLog2"
      }
    }

    template {
      metadata {
        labels = {
          app = "TimeLog2"
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

resource "kubernetes_service_v1" "timelog2svc" {
  metadata {
    name = "timelog2svc"
    namespace = kubernetes_namespace.timelog2test.metadata.0.name
  }
  spec {
    selector = {
      app = "Timelog2"
    }
    session_affinity = "ClientIP"
    port {
      port        = 80
      target_port = 3000
    }
    type = "LoadBalancer"
  }
}
