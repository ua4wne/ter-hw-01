terraform {
  required_version = ">=1.8.4"

  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = ">= 0.134.0"
    }
  }
}

provider "yandex" {
  token     = var.ya_token
  cloud_id  = var.ya_cloud_id
  folder_id = var.ya_folder_id
  zone      = var.ya_zone
}

