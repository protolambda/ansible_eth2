#!/bin/sh

curl localhost:{{beacon_metrics_port}}/metrics | curl --data-binary @- http://{{pushgateway_ip}}/metrics/job/pushgateway/scrape_location/beacon/network/{{eth2_network_name}}/instance/$(hostname)/client/{{eth2client_name}}

curl localhost:9100/metrics | curl --data-binary @- http://{{pushgateway_ip}}/metrics/job/pushgateway/scrape_location/node_exporter/network/{{eth2_network_name}}/instance/$(hostname)/client/{{eth2client_name}}


{%- if validator_enabled is sameas true %}


curl localhost:{{validator_metrics_port}}/metrics | curl --data-binary @- http://{{pushgateway_ip}}/metrics/job/pushgateway/scrape_location/validator/network/{{eth2_network_name}}/instance/$(hostname)/client/{{eth2client_name}}
{% endif %}