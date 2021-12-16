terraform {
  required_providers {
    nutanix = {
      source  = "nutanix/nutanix"
      version = "1.2.0"
    }
  }
}

data "nutanix_cluster" "cluster" {
  name = var.cluster_name
}
data "nutanix_subnet" "subnet" {
  subnet_name = var.subnet_name
}

provider "nutanix" {
  username     = var.user
  password     = var.password
  endpoint     = var.endpoint
  insecure     = true
  wait_timeout = 60
}

data "nutanix_image" "image" {
  image_name = "CentOS-7-x86_64-2111.qcow2"
}

locals {
  default_image_uuid = data.nutanix_image.image.metadata.uuid
}

resource "nutanix_virtual_machine" "vm" {
  count                = 3
  name                 = "kubernetes-${count.index}"
  cluster_uuid         = data.nutanix_cluster.cluster.id
  num_vcpus_per_socket = "4"
  num_sockets          = "1"
  memory_size_mib      = 8192


  #cloud-init
  guest_customization_cloud_init_user_data ="${base64encode("${file("cloud-init.yml")}")}"

  disk_list {
    data_source_reference = {
      kind = "image"
      uuid = local.default_image_uuid
    }
  }

  disk_list {
    disk_size_bytes = 20 * 1024 * 1024 * 1024
    device_properties {
      device_type = "DISK"
      disk_address = {
        "adapter_type" = "SCSI"
        "device_index" = "1"
      }
    }
  }
  nic_list {
    subnet_uuid = data.nutanix_subnet.subnet.id
  }
}

