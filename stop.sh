#!/bin/bash

echo "[+] Killing previous VLC..."
pkill -f "VLC"

echo "[+] Stopping previous container..."
docker stop aceproxy
