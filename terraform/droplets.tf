resource "digitalocean_droplet" "application" {
    count              = var.app_config.count
    backups            = false
    image              = var.app_config.image
    ipv6               = false
    monitoring         = false
    name               = "app-${count.index}"
    private_networking = true
    region             = var.main_config.region
    resize_disk        = false
    size               = var.app_config.size
    tags               = [
        "app"
    ]
    volume_ids         = []
    ssh_keys           = [digitalocean_ssh_key.main.fingerprint]
    vpc_uuid           = digitalocean_vpc.main.id
}

resource "digitalocean_droplet" "database" {
    backups            = false
    image              = var.db_config.image
    ipv6               = false
    monitoring         = false
    name               = "database"
    private_networking = true
    region             = var.main_config.region
    resize_disk        = false
    size               = var.db_config.size
    tags               = [
        "db"
    ]
    volume_ids         = []
    ssh_keys           = [digitalocean_ssh_key.main.fingerprint]
    vpc_uuid           = digitalocean_vpc.main.id
}
