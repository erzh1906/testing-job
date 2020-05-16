resource "digitalocean_vpc" "main" {
  name     = "main-project-network"
  region   = var.main_config.region
  ip_range = var.main_config.vpc_cidr
}
