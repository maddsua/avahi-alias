#!/bin/bash

[[ -z "$1" ]] && echo "Usage: $0 [alias.local]" && exit 1

until ORIGINAL_IP=$(hostname -I | cut -d' ' -f1) && [[ -n "$ORIGINAL_IP" ]]; do
	sleep 2
done

/usr/bin/avahi-publish -a "$1" -R "$ORIGINAL_IP" &

echo "Broadcasting $1 on $ORIGINAL_IP"

while true; do
	sleep 5
	if [[ "$(hostname -I | cut -d' ' -f1)" != "$ORIGINAL_IP" ]]; then
		echo "IP changed. Killing myself so systemd can fix your mess."
		exit 1
	fi
done
