variable "app_port" {
  default = 80
}

variable "app_name" {}
variable "node_port" {}
variable "replica_count" {}
variable "imagefromdockerhub" {}

variable "files" {
  default = [
    "main.tf" ,
    "NodePort.tf" ,
    "terraform.tfvars" ,
    "vars.tf",
    "htmlka.tf"
  ]

}
