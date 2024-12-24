data "yandex_compute_image" "image" {
  family = var.image_family
}

resource "yandex_compute_instance_group" "vm-group" {
  name               = var.group_name
  service_account_id = var.service_account_id

  instance_template {
    platform_id = var.platform_id

    resources {
      core_fraction = var.resources.core_fraction
      memory        = var.resources.memory
      cores         = var.resources.cores
    }

    boot_disk {
      initialize_params {
        image_id = data.yandex_compute_image.image.image_id
        size     = var.boot_disk_size
      }
    }

    network_interface {
      network_id = var.network_id
      subnet_ids = var.subnet_ids
      nat        = var.has_nat
    }

    metadata = var.metadata
  }

  scale_policy {
    fixed_scale {
      size = var.instances_count
    }
  }

  allocation_policy {
    zones = var.subnet_zones
  }

  deploy_policy {
    max_unavailable = var.max_unavailable
    max_expansion   = var.max_expansion
  }

  application_load_balancer {
    target_group_name = var.target_group_name
  }
}
