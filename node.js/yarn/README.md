# sandbox/Yarn | chusiang

Yarn: A new package manager for JavaScript

## Installation

### macOS

> You will need to first install Node.js if you don’t already have it installed.

Installation Script

    curl -o- -L https://yarnpkg.com/install.sh | bash

Manual Install via tarball

    cd /opt
    wget https://yarnpkg.com/latest.tar.gz
    tar zvxf yarn-*.tar.gz
    # Yarn is now in /opt/yarn-[version]/

Test that Yarn is installed by running:

    yarn --version

### Linux

Debian, Ubuntu

    sudo apt-key adv --keyserver pgp.mit.edu --recv D101F7899D41F3C3
    echo "deb http://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update && sudo apt-get install yarn

CentOS / Fedora / RHEL

    sudo wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
    curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
    sudo yum install yarn

Test that Yarn is installed by running:

    yarn --version

## Usage

Starting a new project

    yarn init

Adding a dependency

    yarn add [package]
    yarn add [package]@[version]
    yarn add [package]@[tag]

Updating a dependency

    yarn upgrade [package]
    yarn upgrade [package]@[version]
    yarn upgrade [package]@[tag]

Removing a dependency

    yarn remove [package]

Installing all the dependencies of project

    yarn

or

    yarn install



## Reference

- [Yarn: A new package manager for JavaScript | Engineering Blog | Facebook Code](https://code.facebook.com/posts/1840075619545360)
- [Installation | Yarn](https://yarnpkg.com/en/docs/install)
- [Usage | Yarn](https://yarnpkg.com/en/docs/usage)

