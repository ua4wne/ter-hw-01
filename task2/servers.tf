data "yandex_compute_image" "os_image" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_instance" "vm" {
  name                      = "vm-test"
  allow_stopping_for_update = true

  resources {
    core_fraction = 20 # Гарантированная доля vCPU
    cores         = 2  # vCPU
    memory        = 1
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.os_image.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_terraform.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }

  # прерываемая ВМ
  scheduling_policy {
    preemptible = true
  }

  platform_id = "standard-v1" # тип процессора (Intel Broadwell)

}
