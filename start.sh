#!/bin/sh

nitriding -fqdn notary.eternis.ai -appwebsrv http://127.0.0.1:7047 -ext-pub-port 443 -intport 8080 -acme true &
echo "[sh] Started nitriding."

sleep 1

/app/notary-server --config-file /app/config/config_dev.yml
echo "[sh] Notary server closed."
