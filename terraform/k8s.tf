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

resource "kubernetes_service" "timelog2svc" {
  metadata {
    name = "timelog2svc"
  }
  spec {
    selector = {
      app = kubernetes_deployment.timelog2.metadata.0.labels.app
    }
    port {
      port        = 3000
      target_port = 3000
    }
    type = "LoadBalancer"
  }
  depends_on = [ kubernetes_deployment.timelog2 ]
}


resource "kubernetes_endpoints" "timelog2endpoints" {
  metadata {
    name = kubernetes_service.timelog2svc.metadata[0].name
  }

  subset {
   address {
      ip = "10.0.0.4"
    }

    address {
      ip = "10.0.0.5"
    }
    
    port {
      port     = 3000
      name     = "http"
      protocol = "TCP"
    }
  }
  depends_on = [ kubernetes_service.timelog2svc ]
}
