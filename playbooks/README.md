# Example playbooks and usage

After getting the machines running and configuring an inventory, run through the setup:

```shell script
# Install docker and other misc. things to get running
ansible-playbook -i my_inventory setup_network_general.yml

# Set up metrics (Alternatively configure existing metrics server to scrape clients)
# Note: before setting up metrics, point a metrics url(s) to the IP(s) that host metrics nodes
# The metrics setup will run through letsencrypt proof-of-possesion of domain name. 
ansible-playbook -i my_inventory setup_network_metrics.yml

# Optionally, to run an eth2stats server to connect beacon nodes, start one:
ansible-playbook -i my_inventory setup_network_eth2stats.yml

# Set up bootnodes (Alternatively configure nodes to use existing bootnodes)
# Note: configure a p2p private key for each bootnode
ansible-playbook -i my_inventory setup_network_bootnodes.yml

# Manual step: Now collect ENR address and configure bootnodes list
# If running eth2stats: Also take the eth2stats server address and configure eth2stats clients to use it

# Now deploy the validators, beacon nodes, eth2stats (if enabled)
ansible-playbook -i my_inventory setup_network_nodes.yml
```

