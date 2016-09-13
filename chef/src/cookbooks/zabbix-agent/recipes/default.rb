# ============================================================
#  Author: Chu-Siang Lai / chusiang.lai (at) gmail.com
#  Filename: default.rb
#  Modified: 2016-09-13 19:38
#  Description: A sample Chef cookbook for zabbix-agent.
#  Reference: 
#
#   - [Rails 佈署實戰教學] 使用 Chef-Solo 一鍵安裝機器 - 好麻煩部落格
#    - http://gogojimmy.net/2013/06/01/Chef-Solo-Basic-with-Vagrant/
#
# =========================================================== 

# install packages.
package 'zabbix-agent'

# service register.
service 'zabbix-agent' do
  supports [:status, :restart, :reload]
    
  action :start
end

# modify configure with template.
template '/etc/zabbix/zabbix_agentd.conf' do
  source 'zabbix_agentd.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[zabbix-agent]', :immediately
end

# vim: ft=ruby.eruby.chef :
