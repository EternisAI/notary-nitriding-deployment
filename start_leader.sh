#!/bin/sh

nitriding -fqdn leader.cluster.eternis.ai -fqdn-leader leader.cluster.eternis.ai -appwebsrv http://127.0.0.1:7047 -ext-pub-port 443 -intport 8080 &
echo "[sh] Started nitriding."

sleep 20;

while true; do
    response=$(curl -s -o /dev/null -w "%{http_code}" https://localhost:444/enclave/leader -k)
    if [ "$response" = "410" ]; then
        echo "[sh] Nitriding is ready."
        break
    else
        echo "[sh] Waiting for nitriding to be ready..."
        sleep 5
    fi
done

/app/notary-server --config-file /app/config/config_leader.yml
echo "[sh] Started notary-server."
