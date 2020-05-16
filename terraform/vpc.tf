resource "digitalocean_vpc" "main" {
  name     = var.main_config.vpc_name
  region   = var.main_config.region
  ip_range = var.main_config.vpc_cidr
}
