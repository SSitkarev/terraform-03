###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

###common vars

variable "vm_os_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "OS version"
}

variable "vm_cores" {
  type        = string
  default     = "2"
  description = "cores"
}

variable "vm_memory" {
  type        = string
  default     = "1"
  description = "memory"
}

variable "vm_core_fraction" {
  type        = string
  default     = "5"
  description = "core_fraction"
}

variable "each_vm" {
  type = list(object({cpu=number, memory=number, disk=number}))
  default = [
    {  cpu=2, memory=1, disk=10 },
    {  cpu=4, memory=2, disk=20 }
  ]
} 

variable "disk_vm_count" {
  type = string
  default = "3"
}

variable "disk_vm_size" {
  type = string
  default = "1"
}