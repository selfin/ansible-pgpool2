#!/bin/bash

 FALLING_NODE=$1         # %h
 NEW_PRIMARY=$2         # %H
# KEY_PATH="/var/lib/postgresql/.ssh/id_rsa"

echo "Failed node: $FALLING_NODE"
echo "NEW_PRIMARY node: $NEW_PRIMARY"
ssh -T -l postgres -o StrictHostKeyChecking=no $FALLING_NODE "/usr/bin/repmgr -h $NEW_PRIMARY -p {{ pg_port }} -D /var/lib/postgresql/{{ pg_version }}/main/ -d repmgr -U repmgr -R postgres standby follow"
echo "followmaster $NEW_PRIMARY passed"
exit 0;
