##!/bin/bash

PATH=$HOME/bin:/sbin:/usr/sbin:$PATH

if pgrep -f dockerd-rootless.sh > /dev/null; then
    echo "dockerd-rootless sudah running, skip."
else
    echo "Menjalankan dockerd-rootless..."
    dockerd-rootless.sh &
fi

