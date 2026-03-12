#!/bin/bash

KYTOS_URL=$1

if [ -z "$KYTOS_URL" ]; then
	echo "Please provide kytos URL. Example: $0 http://127.0.0.1:8181"
	exit 0
fi

TOPOLOGY_API="$KYTOS_URL/api/kytos/topology/v3"


# Ampath1
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/switches/00:00:00:00:00:00:00:11/enable
curl -H 'Content-Type: application/json' -X POST -d'{"node_name": "Ampath1", "lat": 23, "lng": -10}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:11/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"address": "Equinix MI1, Miami, FL"}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:11/metadata
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:11:1/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:11:2/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:11:3/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:11:4/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:11:5/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:11:15/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:11:16/enable
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth1"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:11:1/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth2"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:11:2/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth3"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:11:3/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth4"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:11:4/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth5"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:11:5/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth15"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:11:15/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth16"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:11:16/metadata

# Ampath2
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/switches/00:00:00:00:00:00:00:12/enable
curl -H 'Content-Type: application/json' -X POST -d'{"node_name": "Ampath2", "lat": 23, "lng": -50}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:12/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"address": "Equinix MI1, Miami, FL"}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:12/metadata
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:12:1/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:12:3/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:12:4/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:12:5/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:12:6/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:12:15/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:12:16/enable
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth1"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:12:1/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth3"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:12:3/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth4"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:12:4/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth5"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:12:5/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth6"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:12:6/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth15"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:12:15/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth16"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:12:16/metadata

# SouthernLight2
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/switches/00:00:00:00:00:00:00:13/enable
curl -H 'Content-Type: application/json' -X POST -d'{"node_name": "SoL2", "lat": -22, "lng": -38}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:13/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"address": "Equinix SP4, Sao Paulo, Brazil"}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:13/metadata
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:13:1/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:13:2/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:13:4/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:13:5/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:13:16/enable
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth1"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:13:1/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth2"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:13:2/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth4"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:13:4/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth5"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:13:5/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth16"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:13:16/metadata

# SanJuan
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/switches/00:00:00:00:00:00:00:14/enable
curl -H 'Content-Type: application/json' -X POST -d'{"node_name": "SanJuan", "lat": 30, "lng": -110}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:14/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"address": "Hub787, San Juan, Puerto Rico"}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:14/metadata
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:14:3/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:14:6/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:14:16/enable
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth3"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:14:3/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth6"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:14:6/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth16"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:14:16/metadata

# AndesLight2
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/switches/00:00:00:00:00:00:00:15/enable
curl -H 'Content-Type: application/json' -X POST -d'{"node_name": "AndesLight2", "lat": -38, "lng": -80}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:15/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"address": "CenturyLink, Santiago, Chile"}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:15/metadata
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:15:1/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:15:3/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:15:5/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:15:15/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:15:16/enable
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth1"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:15:1/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth3"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:15:3/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth5"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:15:5/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth15"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:15:15/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth16"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:15:16/metadata

# AndesLight3
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/switches/00:00:00:00:00:00:00:16/enable
curl -H 'Content-Type: application/json' -X POST -d'{"node_name": "AndesLight3", "lat": -38, "lng": -58}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:16/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"address": "CenturyLink, Santiago, Chile"}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:16/metadata
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:16:1/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:16:2/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:16:16/enable
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth1"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:16:1/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth2"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:16:2/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth16"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:16:16/metadata

# Ampath3
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/switches/00:00:00:00:00:00:00:17/enable
curl -H 'Content-Type: application/json' -X POST -d'{"node_name": "Ampath3", "lat": 35, "lng": -30}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:17/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"address": "Equinix MI1, Miami, FL"}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:17/metadata
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:17:2/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:17:3/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:17:16/enable
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth2"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:17:2/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth3"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:17:3/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth16"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:17:16/metadata

# Ampath4
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/switches/00:00:00:00:00:00:00:18/enable
curl -H 'Content-Type: application/json' -X POST -d'{"node_name": "Ampath4", "lat": 45, "lng": -10}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:18/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"address": "Equinix MI3, Boca Raton, FL"}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:18/metadata
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:18:1/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:18:2/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:18:3/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:18:4/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:18:16/enable
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth1"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:18:1/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth2"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:18:2/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth3"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:18:3/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth4"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:18:4/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth16"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:18:16/metadata

# Ampath5
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/switches/00:00:00:00:00:00:00:19/enable
curl -H 'Content-Type: application/json' -X POST -d'{"node_name": "Ampath5", "lat": 45, "lng": -50}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:19/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"address": "Equinix MI1, Miami, FL"}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:19/metadata
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:19:1/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:19:4/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:19:5/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:19:16/enable
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth1"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:19:1/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth4"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:19:4/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth5"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:19:5/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth16"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:19:16/metadata

# Ampath7
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/switches/00:00:00:00:00:00:00:20/enable
curl -H 'Content-Type: application/json' -X POST -d'{"node_name": "Ampath7", "lat": 25, "lng": 10}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:20/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"address": "Equinix MI1, Miami, FL"}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:20/metadata
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:20:1/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:20:2/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:20:16/enable
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth1"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:20:1/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth2"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:20:2/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth16"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:20:16/metadata

# JAX1
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/switches/00:00:00:00:00:00:00:21/enable
curl -H 'Content-Type: application/json' -X POST -d'{"node_name": "JAX1", "lat": 55, "lng": -20}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:21/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"address": "CenturyLink, Jacksonville, FL"}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:21/metadata
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:21:1/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:21:4/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:21:16/enable
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth1"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:21:1/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth4"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:21:4/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth16"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:21:16/metadata

# JAX2
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/switches/00:00:00:00:00:00:00:22/enable
curl -H 'Content-Type: application/json' -X POST -d'{"node_name": "JAX2", "lat": 55, "lng": -40}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:22/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"address": "CenturyLink, Jacksonville, FL"}' $TOPOLOGY_API/switches/00:00:00:00:00:00:00:22/metadata
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:22:1/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:22:5/enable
curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:22:16/enable
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth1"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:22:1/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth5"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:22:5/metadata
curl -H 'Content-Type: application/json' -X POST -d'{"mtu": 9000, "port_name": "eth16"}' $TOPOLOGY_API/interfaces/00:00:00:00:00:00:00:22:16/metadata

# Enable links
sleep 5

for LINK in $(curl -sH 'Content-Type: application/json'  $TOPOLOGY_API/links | python3 -m json.tool | fgrep "\"link\":" | sed 's/[ |,|"]//g'|cut -d":" -f2 | uniq);
  do
    curl -H 'Content-Type: application/json' -X POST $TOPOLOGY_API/links/$LINK/enable;

    echo '{"link_name": "Link_random"}' |  sed "s/random/${LINK:0:18}/" > /tmp/random.json;
    curl -H 'Content-Type: application/json' -X POST -d@/tmp/random.json $TOPOLOGY_API/links/$LINK/metadata;

    echo '{"packet_loss": 0.00random}' |  sed "s/random/${RANDOM:0:10}/" > /tmp/random.json;
    curl -H 'Content-Type: application/json' -X POST -d@/tmp/random.json $TOPOLOGY_API/links/$LINK/metadata;

    curl -H 'Content-Type: application/json' -X POST -d'{"availability": 99.5}' $TOPOLOGY_API/links/$LINK/metadata;

    echo '{"residual_bandwidth": random}' |  sed "s/random/${RANDOM:0:2}/" > /tmp/random.json;
    curl -H 'Content-Type: application/json' -X POST -d@/tmp/random.json $TOPOLOGY_API/links/$LINK/metadata;

    echo '{"latency": random}' |  sed "s/random/${RANDOM:0:2}/" > /tmp/random.json;
    curl -H 'Content-Type: application/json' -X POST -d@/tmp/random.json $TOPOLOGY_API/links/$LINK/metadata;
  done
