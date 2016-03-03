# Ansible

## Setup

1. Install the Ansible.
2. Install the Vagrant.
3. Inatall some packages

        # Debian & Ubuntu
        $ sudo apt-get install make

3. initialization.

        $ make init

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
