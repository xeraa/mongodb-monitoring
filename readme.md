# MongoDB Monitoring with the Elastic Stack

This repository will install MongoDB to monitor it with the [Elastic Stack](https://www.elastic.co/products) (using Elasticsearch, Kibana, Beats, and Logstash) and X-Pack. You can start from scratch and configure everything with [Vagrant and Ansible](#vagrant-and-ansible).



## Features

* Logs: Collect the MongoDB log and parse it in a sensible fashion.
* Metrics: Collect the statistics MongoDB provides.
* Network: Monitor the MongoDB network traffic and visualize its performance.
* Activity: Generate MongoDB data with [POCDriver](https://github.com/johnlpage/POCDriver):
  * Show a sample dataset: `$ java -jar /opt/pocdriver/bin/POCDriver.jar -p`
  * Do 20 **k**ey lookups, do 10 **i**nserts, **u**update 10 documents by incrementing an integer in them, and use a **b**atch size of 20:`$ java -jar /opt/pocdriver/bin/POCDriver.jar -k 20 -i 10 -u 10 -b 20`
* Generate more data including errors: `$ mongo /elastic-stack/mongodb.js`
* Injector: Generate Elasticsearch data: `$ java -jar /opt/injector.jar 100000 1000`



## Vagrant and Ansible

Do a simple `vagrant up` by using [Vagrant](https://www.vagrantup.com)'s [Ansible provisioner](https://www.vagrantup.com/docs/provisioning/ansible.html). All you need is a working [Vagrant installation](https://www.vagrantup.com/docs/installation/) (2.0.0+ but the latest version is always recommended), a [provider](https://www.vagrantup.com/docs/providers/) (tested with the latest [VirtualBox](https://www.virtualbox.org) version), and 2.5GB of RAM.

With the [Ansible playbooks](https://docs.ansible.com/ansible/playbooks.html) in the */elastic-stack/* folder you can configure the whole system step by step. Just run them in the given order inside the Vagrant box:

```
> vagrant ssh
$ ansible-playbook /elastic-stack/1_configure-mongodb.yml
$ ansible-playbook /elastic-stack/2_configure-elasticsearch.yml
$ ansible-playbook /elastic-stack/3_configure-kibana.yml
$ ansible-playbook /elastic-stack/4_configure-beats.yml
$ ansible-playbook /elastic-stack/5_configure-dashboards.yml
$ ansible-playbook /elastic-stack/6_configure-logstash.yml
```

Or if you are in a hurry, run all playbooks with `$ /elastic-stack/all.sh` at once.

For workshops, reset the fully configured environment with `$ ansible-playbook /elastic-stack/prepare-workshop.yml`.


## Kibana

Access Kibana at [http://localhost:5601](http://localhost:5601). You will need to login into Kibana with the default credentials — username `elastic` and password `changeme`.



## MongoDB
