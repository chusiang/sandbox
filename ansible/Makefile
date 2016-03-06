.PHONY: All init init_ansible init_vagrant run clean

All: init


init: init_ansible init_vagrant

init_ansible:
	-cp ansible.cfg.sample ansible.cfg
	-cp hosts.sample hosts

init_vagrant:
	-cp Vagrantfile.sample Vagrantfile
	vagrant up


run:
	vagrant up


clean:
	vagrant destroy

