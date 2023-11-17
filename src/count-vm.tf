data "yandex_compute_image" "ubuntu" {
  family = var.vm_os_family
}

resource "yandex_compute_instance" "web" {
  count = 2
  name = "web-${count.index + 1}"
  resources {
        cores = var.vm_cores
        memory = var.vm_memory
        core_fraction = var.vm_core_fraction
  }

  boot_disk {
        initialize_params {
        image_id = data.yandex_compute_image.ubuntu.image_id
        }
  }
  
  allow_stopping_for_update = true

  scheduling_policy {
    preemptible = true
  }

  network_interface {
        subnet_id = yandex_vpc_subnet.develop.id
        nat     = true
        security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
        ssh-keys = "ubuntu:${file("C:/Users/Sergey/.ssh/id_rsa.pub")}"
        serial-port-enable = 1
  }
}