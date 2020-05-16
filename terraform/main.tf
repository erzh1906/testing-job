variable "main_config" {
  type = object({
    token       = string
    ssh_name    = string
    public_key  = string
    vpc_name    = string
    region      = string
    vpc_cidr    = string
  })
  default = {
    token       = "1234"
    ssh_name    = "main"
    public_key  = "ssh-rsa abcdef"
    vpc_name    = "main-project-network"
    region      = "ams3"
    vpc_cidr    = "172.16.0.0/16"
  }
}

variable "app_config" {
  type = object({
    count         = number
    image         = string
    size          = string
  })
  default = {
    count         = 1
    image         = "centos-7-x64"
    size          = "s-2vcpu-4gb"
  }
}

variable "db_config" {
  type = object({
    image         = string
    size          = string
  })
  default = {
    image         = "centos-7-x64"
    size          = "s-2vcpu-4gb"
  }
}

variable "volume_config" {
  type = object({
    name          = string
    size          = number
    fs_type       = string
  })
  default = {
    name          = "dbdata"
    size          = 50
    fs_type       = "xfs"
  }
}

provider "digitalocean" {
  version    = "~> 1.18"
  token      = var.main_config.token
}

resource "digitalocean_ssh_key" "main" {
    name        = var.main_config.ssh_name
    public_key  = var.main_config.public_key
}
