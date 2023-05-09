resource "docker_image" "nginx-image" {
  name = "nginx:latest"

  build {
    context    = path.cwd
    dockerfile = "Dockerfile"
  }

}

resource "kubernetes_namespace" "test" {
  metadata {
    name = var.namespace
  }
}


resource "kubernetes_storage_class" "test-storage-class" {
  metadata {
    name = "test-sc"
  }
  storage_provisioner = "kubernetes.io/no-provisioner"
  reclaim_policy      = "Retain"
  volume_binding_mode = "Immediate"
  parameters = {
    type = "local"
  }
}
resource "kubernetes_persistent_volume" "test" {
  metadata {
    name = "test-example"
    #namespace = "test"
  }
  spec {
    storage_class_name = "hostpath"
    capacity = {
      storage = "2Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      host_path {
        path = "${path.cwd}/pvc"
        type = "Directory"
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "test" {
  metadata {
    name      = "testpvc2"
    namespace = var.namespace
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "1Mi"
      }
    }
    #volume_name        = kubernetes_persistent_volume.test.metadata.0.name
    storage_class_name = "hostpath"

  }
  wait_until_bound = false
}



resource "kubernetes_service" "test-service" {
  metadata {
    name      = "test-service"
    namespace = var.namespace
    labels = {
      "app" = var.app
    }
  }
  spec {
    port {
      port        = 8080
      target_port = 80
    }

    type = var.servicetype
  }
}

resource "kubernetes_deployment" "test-deploy" {
  metadata {
    name      = "test-deploy"
    namespace = var.namespace
    labels = {
      app = var.app
    }
  }
  spec {
    replicas = 2

    selector {
      match_labels = {
        app = var.app
      }
    }
    template {
      metadata {
        labels = {
          app = var.app
        }
      }

      spec {
        container {
          name  = "test-container"
          image = "nginx:latest"

          resources {
            limits = {
              cpu    = "500m"
              memory = "512Mi"
            }
            requests = {
              cpu    = "500m"
              memory = "512Mi"
            }
          }
          volume_mount {
            name       = var.volumename
            mount_path = "/var/log/nginx"
          }
        }


        volume {
          name = var.volumename
          persistent_volume_claim {
            claim_name = "testpvc2"
          }
        }


      }
    }
  }
}

