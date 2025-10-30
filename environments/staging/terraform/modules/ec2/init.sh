#!/bin/bash
set -euo pipefail

# For Amazon Linux 2023
{
  echo "###################################"
  echo " START USER DATA SCRIPT $(date)"
  echo "###################################"
} >> /var/log/user_data.log

echo "ECS_CLUSTER=hogwarts-cluster" >> /etc/ecs/ecs.config

{
  echo "###### FINISHED USER DATA SCRIPT ###### $(date)"
} >> /var/log/user_data.log
