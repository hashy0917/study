#!/bin/sh
if [ -e $PWD/terraform.tfstate ]; then
    ip=`cat $PWD/terraform.tfstate | jq '.resources[].instances[]' | jq '.attributes.nic_list_status[].ip_endpoint_list[].ip' 2> /dev/null | sed -e 's/"//g' | sed -ze 's/\n/,/g'`
    cat <<EOS
{
    "cloud_servers"  : [ $ip ]
}
EOS
fi
