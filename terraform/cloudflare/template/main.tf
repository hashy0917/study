provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

provider "cloudflare" {
  email = var.cloudflare_email
  token = var.cloudflare_token
}

data "vsphere_datacenter" "dc" {
  name = "LocalDatacenter"
}

data "vsphere_datastore" "datastore" {
  name          = "Datastore 2"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = "UbuntuServer20.04-template"
  datacenter_id = data.vsphere_datacenter.dc.id
}

#data "vsphere_resource_pool" "pool" {
#  name          = "10.0.0.202/Resources"
#  datacenter_id = data.vsphere_datacenter.dc.id
#}

data "vsphere_resource_pool" "pool" {
  name          = "resource_pool_test"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "sdcc"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = "terraform-test"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 2
  memory   = 1024
  guest_id = "ubuntu64Guest"

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "disk0"
    size  = 20
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "terraform-test"
        domain    = "terraform-test.svrop.net"
      }
      network_interface {
        #ipv4_address = "10.0.0.10"
        #ipv4_netmask = 24
      }
      #ipv4_gateway = "10.0.0.1"
    }
  }
}

resource "cloudflare_record" "gill-search-manage" {
  domain = var.cloudflare_domain
  name   = "gill-search-manage"
  value  = "${vsphere_virtual_machine.vm.default_ip_address}"
  type   = "A"
  ttl    = 1
  proxied = false
}
