#!/bin/bash
# =====================================================================
#  provision_staging_env.sh   v3.7  (DO NOT EDIT - ask Mike)
#  FICTIONAL PROP for the Fedora Lane demo - shows "before" state only.
#  Not meant to be run.
# =====================================================================
set -e
REGION=${REGION:-us-east-1}
DB_DISK=${DB_DISK:-40}          # also overridden on line 87?? and in env.cfg
APP_DISK=40
OWNER=$1; ENVNAME=$2; [ -z "$ENVNAME" ] && ENVNAME=stg$RANDOM
source /home/mike/scripts/env.cfg 2>/dev/null || true
# ... 180 lines of instance / security-group setup omitted ...
VOL=$(aws ec2 create-volume --size $DB_DISK --region $REGION \
      --availability-zone ${REGION}a | jq -r .VolumeId)
if [ -z "$VOL" ]; then echo "ERR 17"; exit 17; fi
aws ec2 create-tags --resources $VOL --tags Key=Owner,Value=$OWNER   # TODO env tag
sleep 30
aws ec2 attach-volume --volume-id $VOL --instance-id $IID --device /dev/sdf || exit 23
# TODO(mike): cleanup on failure?? re-running creates a SECOND volume
ssh -i ~/keys/prod.pem ec2-user@$IP "sudo mkfs.xfs /dev/nvme1n1 && sudo mount ..." # pls fix key
# ... 290 more lines ...
