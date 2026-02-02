#!/usr/bin/env bash

# Cek apakah ada interface aktif
if ! ip link show up | grep -q "state UP"; then
    echo "{\"text\": \"Offline\", \"class\": \"disconnected\"}"
    exit 0
fi

# Cek koneksi internet
if ping -q -c 1 -W 1 google.com >/dev/null 2>&1; then
    echo "{\"text\": \"Internet\", \"class\": \"connected\"}"
else
    echo "{\"text\": \"No internet\", \"class\": \"local\"}"
fi

