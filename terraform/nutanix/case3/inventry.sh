#!/bin/sh
if [ -e $PWD/terraform.tfstate ]; then
    ip=`cat $PWD/terraform.tfstate | jq '.resources[].instances[]' | jq '.attributes.nic_list_status[].ip_endpoint_list[].ip' 2> /dev/null`
    cat <<EOS
{
    "cloud_servers"  : [ $ip ]
}
EOS
fi
