# Crear un volumen adicional
resource "cloudstack_disk" "extravolume" {
  count              = var.master_count
  name             = "second-disk"
  attach             = "true"
  disk_offering      = "GOLD_50GB"
  zone               = var.cloud-tu-nube["zone_name"]
  virtual_machine_id = "${cloudstack_instance.ubuntuinstance[0].id}"
}

# Crear una máquina virtual Ubuntu 22.04
resource "cloudstack_instance" "ubuntuinstance" {
  count = var.master_count
  display_name = var.master_tags[count.index]
  name = var.master_tags[count.index]
  service_offering = var.cloud-tu-nube["node_type"]
  template = var.cloud-tu-nube["template_name"]
  zone = var.cloud-tu-nube["zone_name"]
  network_id = var.cloud-tu-nube["network_id"]
  expunge = true
  keypair = "nombre-tus-keys" # creadas previamente
  root_disk_size   = 20
  user_data = file("script.sh")
}

