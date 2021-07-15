
# Ansible galaxy role for setting up eth2 forkmon

## Intro

eth2 forkmon can be used to track the status of multiple eth2 nodes. Information such as epoch, slot, head state are presented
on a webpage.

## Setup

- Install the ansible-galaxy role by using `ansible-galaxy install parithosh.ansible_role_eth2_forkmon`
- Set up the required variables in `group_vars/eth2_forkmon`:
    - forkmon_dir: directory on the server to store the config file
    - eth2-forkmon-image: container image to run
    - forkmon_require_restart: if the container should be restarted
    - forkmon_http_listen_port: the host port the container will listen on
    - forkmon_endpoints: a list of "addr" & "eth1" that specifies the eth2 beacon node API IP addresses
    - network_name: name of the network
    - seconds_per_slot: number of seconds per slot
    - genesis_time: genesis time
    - slots_per_epoch: number of slots per epoch
    
- Include the role in a playbook called setup_forkmon.yml:
```yaml
- name: Start forkmon
  hosts: eth2_forkmon
  gather_facts: true
  become: true
  tasks:
    - name: Run forkmon setup
      include_role:
        name: eth2_forkmon
```
- Run the playbook with: ansible-playbook -i inventory/inventory.ini playbook/setup_forkmon.yml
- eth2 forkmon should now be accessible at `<server-ip>:<forkmon_http_listen_port>`
