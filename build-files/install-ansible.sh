#!/usr/bin/bash

if [[ "$RELEASE" == "" ]]; then
  echo "ERROR: Must set \$RELEASE"
  exit 1
fi

# The KA releases require various Ansible versions
# This also makes the build fail if you accidentally run it with an unsupported stable KA branch
# Since we need Python3 now, old versions won't build right at all.

# NOTE(Kyle): Keeping this file to use for future version-pinning.  I expect we'll need it again.

supported="ussuri victoria"
if [[ $(echo $supported | grep "$RELEASE") ]]; then
  pip3 install ansible
else
  echo "ERROR: Unsupported environment var value for \$RELEASE: '$RELEASE'"
  echo "       Expected: $latest_ansible"
  exit 1
fi
