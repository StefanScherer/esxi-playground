#!/bin/bash
docker-machine --debug create -d vmwarevsphere \
  --vmwarevsphere-vcenter="192.168.254.133" \
  --vmwarevsphere-username="root" \
  --vmwarevsphere-password="vagrant" \
  --vmwarevsphere-network="VM Network" \
  --vmwarevsphere-datastore="datastore1" \
  --vmwarevsphere-datacenter="ha-datacenter" \
  dockervm0
