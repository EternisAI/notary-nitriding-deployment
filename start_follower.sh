#!/bin/sh

nitriding -fqdn follower.cluster.eternis.ai -fqdn-leader leader.cluster.eternis.ai -appwebsrv http://127.0.0.1:7047 -ext-pub-port 443 -intport 8080 -wait-for-app -appcmd "/app/notary-server --config-file /app/config/config_follower.yml"&
echo "[sh] Started nitriding."