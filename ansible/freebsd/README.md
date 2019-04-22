# Ansible x Vagrant for FreeBSD

A sample ansible lab for build a FreeBSD environment via Vagrant.

1. Install the Python 2.7 via Vagrantfile.
1. Run playbook.

## Requirements

1. Vagrant.
1. Virtualbox.

## Usage

1. Start and provision the VM via vagrant.

  ```
  [ chusiang@mac ~/freebsd.ansible ]
  (ins)$ vagrant up
  ...
  ==> default: Running provisioner: ansible...
  Vagrant has automatically selected the compatibility mode '2.0'
  according to the Ansible version installed (2.7.9).

  Alternatively, the compatibility mode can be specified in your Vagrantfile:
  https://www.vagrantup.com/docs/provisioning/ansible_common.html#compatibility_mode

      default: Running ansible-playbook...
   ___________________________
  < PLAY [Ansible x FreeBSD.] >
   ---------------------------
          \   ^__^
           \  (oo)\_______
              (__)\       )\/\
                  ||----w |
                  ||     ||

   ________________________
  < TASK [Gathering Facts] >
   ------------------------
          \   ^__^
           \  (oo)\_______
              (__)\       )\/\
                  ||----w |
                  ||     ||

  ok: [default]
   _____________________________
  < TASK [Print mount message.] >
   -----------------------------
          \   ^__^
           \  (oo)\_______
              (__)\       )\/\
                  ||----w |
                  ||     ||

  ok: [default] => {
      "hostvars[inventory_hostname][\"ansible_devices\"]": {
          "ad0": [],
          "ada0": []
      }
  }
  ```

1. Ping this VM via Ansible.

  ```
  [ chusiang@mac ~/freebsd.ansible ]
  (cmd)$ ansible all -m ping
  default | SUCCESS => {
      "changed": false,
      "ping": "pong"
  }
  ```

## License

Copyright (c) chusiang from 2019 under the MIT license.
