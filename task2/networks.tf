resource "yandex_vpc_network" "network_test" {
  name = "network_test"
}

resource "yandex_vpc_subnet" "subnet_terraform" {
  name           = "subnet-test"
  zone           = var.ya_zone
  network_id     = yandex_vpc_network.network_test.id
  v4_cidr_blocks = ["192.168.15.0/24"]
}
