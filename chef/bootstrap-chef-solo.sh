#!/usr/bin/env bash
# ============================================================
#  Author: gogojimmy / jimmy (at) gogojimmy.net
#  GitHub: https://github.com/gogojimmy
#  Filename: bootstrap-chef-solo.sh
#  Modified: 2013-05-26
#  Description: Install Chef-Solo script.
#  Reference: 
#
#   - bootstrap-chef-solo.sh
#    - https://gist.github.com/gogojimmy/5523985
#   - [Rails 佈署實戰教學] 使用 Chef-Solo 一鍵安裝機器 - 好麻煩部落格
#    - http://gogojimmy.net/2013/06/01/Chef-Solo-Basic-with-Vagrant/
#
# =========================================================== 

# bootstrap-chef-solo.sh - https://gist.github.com/gogojimmy/5523985

# Pre-requisites
sudo apt-get -y update
sudo apt-get --no-install-recommends -y install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev libgdbm-dev ncurses-dev automake libtool bison subversion pkg-config libffi-dev vim

# Download and compile Ruby 2.0.0-p0
cd /tmp
wget ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz
tar -xvzf ruby-2.0.0-p0.tar.gz
cd ruby-2.0.0-p0
./configure --prefix=/usr/local
make
make install

# Download and build Chef compatible with Ruby 2.0
cd /tmp
curl -o chef.tar.gz -L https://api.github.com/repos/opscode/chef/tarball/CHEF-3935
tar -xvzf chef.tar.gz
cd opscode-chef-634ad58
sudo gem build chef.gemspec
sudo gem install chef-11.4.0.gem --no-ri --no-rdoc

# The rest
sudo gem install ruby-shadow --no-ri --no-rdoc
