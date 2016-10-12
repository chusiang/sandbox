# Test Kitchen for Chef

## Installing Test Kitchen

    $ gem install test-kitchen

## Creating a Cookbook

1. metadata.rb.

        $ vi metadata.rb
        name "git"
        version "0.1.0"

1. recipe.

        $ vi recipes/default.rb
        package "git"
    
        log "Well, that was too easy."

1. init the kitchen.

        $ kitchen init --driver=kitchen-vagrant
          create  .kitchen.yml
          create  test/integration/default
          create  .gitignore
          append  .gitignore
          append  .gitignore
             run  gem install kitchen-vagrant from "."
        Fetching: kitchen-vagrant-0.12.0.gem (100%)
        Successfully installed kitchen-vagrant-0.12.0
        1 gem installed
        
        # Pro-Tip:
        # The Kitchen Vagrant Driver is the default driver chosen when you omit --driver=kitchen-vagrant from the command. After a few projects, feel free to simply kitchen init.

1. fix `.kitchen.yml`.

        ---
        driver:
          name: vagrant

        provisioner:
          name: chef_solo

        platforms:
          - name: ubuntu-14.04
          #- name: centos-6.4

        suites:
          - name: default
            run_list:
              - recipe[git::default]
            attributes:

## Run Kitchen

1. list kitchen room.

        $ kitchen list

1. create kitchen room.

        $ kitchen create <room_name>

1. Run it.

        $ kitchen converge

## Manually Verifying

1. ssh login.

        $ kitchen login default-ubuntu-1404

1. check git (1).

        $ which git

1. check git (2).

        $ git --version

1. logout.

        $ exit

## Writing a Test

1. create folder.

        $ mkdir -p test/integration/default/bats
    
1. write a sample test.
    
        $ vi test/integration/default/bats/git_installed.bats
        #!/usr/bin/env bats
        
        @test "git binary is found in PATH" {
          run which git
          [ "$status" -eq 0 ]
        }

## Running Kitchen Verify

Run test.

    $ kitchen verify 

## Running Kitchen Test

Run clean test, rebuild a VM and deploy it, again.

    $ kitchen test default-ubuntu-1204

## Reference

- [Creating a Cookbook - KitchenCI](http://kitchen.ci/docs/getting-started/creating-cookbook)

