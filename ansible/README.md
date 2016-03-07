# Ansible Lab | chusiang

Infrastructure of this lab.
           
    ------------------------------------------------
    | -------------------------------------------- |
    | | -----------------      ----------------- | |
    | | |               |      |               | | |
    | | |    jupyter    |      |    ubuntu1    | | |
    | | |               | ---> |               | | |
    | | | (33.33.33.11) |      | (33.33.33.31) | | |
    | | |               |      |               | | |
    | | -----------------      ----------------- | |
    | |            \                             | |
    | |      Vagrant (Virtualbox, Guest OS)      | |
    | -------------------------------------------| |
    |                  \                           |
    |                   Host OS                    |
    ------------------------------------------------


## Setup

1. Install the [Ansible](http://docs.ansible.com/ansible/intro_installation.html) (option) & [Vagrant](https://www.vagrantup.com/downloads.html).
2. Inatall some packages

        # Debian & Ubuntu
        $ sudo apt-get install make

3. initialization.

        $ make init

## Run

1. Boot VMs.

        $ vagrant up
        
        $ vagrant status
        Current machine states:
        
        ubuntu1                   running (virtualbox)
        jupyter                   running (virtualbox)
        ...
        
2. Run ansible-playbook with Vagrant.

        $ vim Vagrantfile
        ...
          config.vm.provision "ansible" do |ansible|
            ansible.playbook = "upgrade-openssl.yml"
            #ansible.sudo = true
            #ansible.verbose = "vvv"
          end

        $ vagrant provision

3. Run with Jupyter (iPython Notebook).

 1. Go to [http://localhost:8888/notebooks/AnsibleNote.ipynb](http://localhost:8888/notebooks/AnsibleNote.ipynb) and play it.
 2. We also see [AnsibleNote.ipynb](https://github.com/chusiang/sandbox/blob/cf72256b4bb3bd08ecac7a9bf9dce6254ee0831e/ansible/AnsibleNote.ipynb) on GitHub.

4. Run with command line.

        $ vagrant ssh
        $ sudo su -
        $ cd /vagrant
        
        $ ansible all -m ping
        ubuntu1 | SUCCESS => {
            "changed": false,
            "ping": "pong"
        }

## Reference

Ansible:

* [Ansible 自動化組態管理實戰講堂 | DevOps 2015 workshop 系列](http://get.soft-arch.net/ansible/) 
* [Ansible 中文權威指南 1.0.1 (非官方)](http://chusiang.github.io/ansible-docs-translate/)
* [sakanamax/LearnAnsible: Some mind map and script for learning ansible](https://github.com/sakanamax/LearnAnsible)
* [2015 12 月份 SA@Tainan 淺談 Ansible 自動化組態管理工具之筆記 | Just for noting](https://m157q.github.io/posts/2015/12/26/study-area-ansible-tutorial-note/)

Vagrant:

* [研發者的虛擬機寶典 | Software Architecture School](http://school.soft-arch.net/courses/vm-for-devops)

Jupyter:

* [Installation — Jupyter Documentation 4.1.0 documentation](http://jupyter.readthedocs.org/en/latest/install.html)
* [jupyter/notebook: Jupyter Interactive Notebook](https://github.com/jupyter/notebook)

