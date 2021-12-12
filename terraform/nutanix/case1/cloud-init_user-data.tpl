#cloud-config
write_files:
  - content: |
      network:
        version: 2
        ethernets:
          ens3:
            addresses:
            - ${ipv4_address}
            gateway4: ${ipv4_gateway}
            nameservers:
              addresses: ${name_server}
              search: [${domain}]
    path: /etc/netplan/50-cloud-init.yaml
hostname: ${hostname}
fqdn: ${hostname}.${domain}
manage_etc_hosts: true
runcmd: 
  - netplan apply
