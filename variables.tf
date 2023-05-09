#Kubernetes namespace name
variable "namespace" {
  type    = string
  default = "test"

}

variable "app" {
  type    = string
  default = "testapp"

}

variable "servicetype" {
  type    = string
  default = "ClusterIP"

}

variable "volumename" {
  type    = string
  default = "testvolume"

}
