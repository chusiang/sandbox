# Ansible

## Setup

### Ansible

1. Create `hosts` file.

        $ cp hosts.sample hosts

### Vagrant

1. Create `Vagrantfile` file.

        $ cp Vagrantfile.sample Vagrantfile

2. Create VM (guest os).

        $ vagrant up

## Run

1. Run ansible-playbook with Vagrant.

        $ vim Vagrantfile
        ...
          config.vm.provision "ansible" do |ansible|
            ansible.playbook = "upgrade-openssl.yml"
            #ansible.sudo = true
            #ansible.verbose = "vvv"
          end

        $ vagrant provision

## Reference

* [sakanamax/LearnAnsible: Some mind map and script for learning ansible](https://github.com/sakanamax/LearnAnsible)
