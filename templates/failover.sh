#!/bin/bash

 FALLING_NODE=$1         # %d
 OLDPRIMARY_NODE=$2      # %P
 NEW_PRIMARY=$3          # %H
# KEY_PATH="/var/lib/postgresql/.ssh/id_rsa"

 if [ $FALLING_NODE = $OLDPRIMARY_NODE ]; then
     echo "Failed node: $FALLING_NODE"
     echo "OLDPRIMARY node: $OLDPRIMARY_NODE"
     echo "NEW_PRIMARY node: $NEW_PRIMARY"
     ssh -T -l postgres -o StrictHostKeyChecking=no $NEW_PRIMARY "repmgr -f /etc/repmgr.conf standby promote 2>/dev/null 1>/dev/null <&-"
     echo "failover passed"
 else
   echo "Failed node: $FALLING_NODE not eq $OLDPRIMARY_NODE"
 fi;

 exit 0;
