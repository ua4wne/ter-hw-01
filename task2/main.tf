terraform {
  required_version = ">=1.8.4"

  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = ">= 0.134.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "yandex" {
  token     = var.ya_token
  cloud_id  = var.ya_cloud_id
  folder_id = var.ya_folder_id
  zone      = var.ya_zone
}

provider "docker" {
  host     = "ssh://ubuntu@${yandex_compute_instance.vm.network_interface[0].nat_ip_address}:22"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}

