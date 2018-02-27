#!/bin/bash

__iscsi_setup() {
  apt install -y open-iscsi
  vim /etc/iscsi/initiatorname.iscsi
  sed -i 's/^\(node\.startup =\) manual$/\1 automatic/' /etc/iscsi/iscsid.conf
  systemctl restart iscsid open-iscsi
  iscsiadm -m discovery -t sendtargets -p 172.16.1.11

  # TODO: Get device and put the PARTUUID in fstab
}
