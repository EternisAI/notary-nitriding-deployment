#!/bin/sh

nitriding -fqdn tlsn.eternis.ai -appwebsrv http://127.0.0.1:7047 -ext-pub-port 443 -intport 8080 &
echo "[sh] Started nitriding."

sleep 1

/opt/aws/amazon-cloudwatch-agent/bin/start-amazon-cloudwatch-agent &

/app/notary-server --config-file /app/config/config_dev.yml
echo "[sh] Notary server closed."
