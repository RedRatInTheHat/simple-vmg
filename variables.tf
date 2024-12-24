variable "image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "The family name of an image. Used to search the latest image in a family."
}

variable "group_name" {
  type        = string
  description = " The name of the instance group."
}

variable "service_account_id" {
  type        = string
  description = "The ID of the service account authorized for this instance group."
}

variable "platform_id" {
  type        = string
  default     = "standard-v3"
  description = "The type of virtual machine to create."
}

variable "resources" {
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
  })
  default = {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  description = "Resource configuration for the instances."
}

variable "boot_disk_size" {
  type        = number
  default     = 10
  description = "The size of the boot disk"
}

variable "network_id" {
  type        = string
  description = "The ID of the network."
}

variable "subnet_ids" {
  type        = list(string)
  description = "The IDs of the subnets."
}

variable "has_nat" {
  type        = bool
  default     = false
  description = "Is a public address provided."
}

variable "metadata" {
  type        = object({ user-data = string })
  description = "Metadata for user creation."
}

variable "instances_count" {
  type        = number
  default     = 1
  description = "Number of instances"
}

variable "subnet_zones" {
  type        = list(string)
  description = "A list of availability zones"
}

variable "max_unavailable" {
  type        = number
  default     = 1
  description = "The maximum number of running instances that can be taken offline (stopped or deleted) at the same time during the update process."
}

variable "max_expansion" {
  type        = number
  default     = 0
  description = "The maximum number of instances that can be temporarily allocated above the group's target size during the update process."
}

variable "target_group_name" {
  type        = string
  description = "The name of the target group"
}
