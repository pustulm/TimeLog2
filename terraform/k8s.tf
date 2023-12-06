resource "kubernetes_namespace" "timelog2test" {
    metadata {
        name = "timelog2test"
    }
}

resource "kubernetes_pod" "timelog2" {
  metadata {
    name = "timelog2"
    labels = {
      app = "timelog2"
    }
  }

  spec {
    container {
      image = "michalp96/timelog2:latest"
      name  = "timelog2"
      
      port {
        container_port = 3000
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
      app = kubernetes_pod.example.metadata.0.labels.app
    }
    port {
      port        = 3000
      target_port = 3000
    }
    type = "LoadBalancer"
  } 
}
