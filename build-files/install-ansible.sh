#!/usr/bin/bash

# The KA releases require various Ansible versions
if [[ "$RELEASE" == "rocky" || "$RELEASE" == "stein" ]]; then
  apt-get install -y ansible
elif [[ "$RELEASE" == "train" ]]; then
  python -m pip install --no-cache-dir "ansible==2.9.7"
else
  echo "ERROR: Unsupported environment var value for \$RELEASE: '$RELEASE'"
  echo "       Expected: rocky, stein, train"
  exit 1
fi
