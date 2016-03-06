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

Ansible:

* [Ansible 自動化組態管理實戰講堂 | DevOps 2015 workshop 系列](http://get.soft-arch.net/ansible/) 
* [Ansible 中文權威指南 1.0.1 (非官方)](http://chusiang.github.io/ansible-docs-translate/)
* [sakanamax/LearnAnsible: Some mind map and script for learning ansible](https://github.com/sakanamax/LearnAnsible)
* [2015 12 月份 SA@Tainan 淺談 Ansible 自動化組態管理工具之筆記 | Just for noting](https://m157q.github.io/posts/2015/12/26/study-area-ansible-tutorial-note/)

Vagrant:

* [研發者的虛擬機寶典 | Software Architecture School](http://school.soft-arch.net/courses/vm-for-devops)

