resource "yandex_compute_disk" "disk_vm" {
  count = var.disk_vm_count
  name = "${"disk"}-${count.index}"
  size = var.disk_vm_size
} 

resource "yandex_compute_instance" "storage" {
  count = 1
  name = "storage-${count.index+1}"
  depends_on = [yandex_compute_disk.disk_vm]
  platform_id = "standard-v1"
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

dynamic "secondary_disk" {
  for_each = yandex_compute_disk.disk_vm[*].id
  content {
    disk_id = secondary_disk.value
  }
}

  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys = local.ssh-keys
  }
} 