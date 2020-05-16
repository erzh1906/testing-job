resource "digitalocean_volume" "db_data" {
  region                  = var.main_config.region
  name                    = "dbdata"
  size                    = var.volume_config.size
  initial_filesystem_type = var.volume_config.fs_type
  description             = "volume for database data"
}

resource "digitalocean_volume_attachment" "db_data" {
  droplet_id = digitalocean_droplet.database.id
  volume_id  = digitalocean_volume.db_data.id
}
