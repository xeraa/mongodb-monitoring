#!/bin/bash

# Run all playbooks at once
ansible-playbook /elastic-stack/1_configure-mongodb.yml
ansible-playbook /elastic-stack/2_configure-elasticsearch.yml
ansible-playbook /elastic-stack/3_configure-kibana.yml
ansible-playbook /elastic-stack/4_configure-beats.yml
ansible-playbook /elastic-stack/5_configure-dashboards.yml
ansible-playbook /elastic-stack/6_configure-logstash.yml
