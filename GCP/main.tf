provider "google" {
  project     = "promising-balm-470808-m6"
 # credentials = file("c:/Users/hr440/Downloads/promising-balm-470808-m6-b506a2693c19.json")
  region      = "us-central1"
  zone        = "us-central1-a"
}
resource "google_compute_instance" "default" {
  name = "first-vm"
  machine_type = "e2-micro"
  network_interface {
    network = "default"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }
  # Some changes require full VM restarts
  # consider disabling this flag in production
  #   depending on your needs
  allow_stopping_for_update = true
}
