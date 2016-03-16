# Deploy Zabbix-Agent with Ansible

藉由 Ansible-playbook 部署 zabbix-agent。

1. 安裝 Ansible 並進行初始化設定。

        $ vim ansible.cfg
        ...

2. 將預部署的機器加至 **hosts** 檔案底下。

        $ vim hosts
        ...

3. 使用說明：

        $ ansible-playbook deploy-zabbix-agent.yml -e "hostname=<NEW_HOSTNAME>" -K -l <NEW_HOST>

    1. 需透過 `-e` 參數來指定 *hostname*。
    2. 藉由 `-l` 來限制執行的 node。

4. 執行結果 (以 vagrant 為例)：

        $ ansible-playbook deploy-zabbix-agent.yml -e "hostname= vagrant" -K -l vagrant
        SUDO password:
        [DEPRECATION WARNING]: Instead of sudo/sudo_user, use become/become_user and make sure become_method is 'sudo' (default). This feature
        will be removed in a future release. Deprecation warnings can be disabled by setting deprecation_warnings=False in ansible.cfg.
        
        PLAY [deploy zabbix-agent] *****************************************************
        
        TASK [setup] *******************************************************************
        ok: [vagrant]
        
        TASK [install zabbix-agent] ****************************************************
        ok: [vagrant]
        
        TASK [check version] ***********************************************************
        changed: [vagrant]
        
        TASK [modify configure] ********************************************************
        ok: [vagrant]
        
        TASK [print version] ***********************************************************
        ok: [vagrant] => {
            "msg": "Zabbix-Agent Version: zabbix-agent\t1:2.4.6+dfsg-1"
        }
        
        PLAY RECAP *********************************************************************
        vagrant                    : ok=6    changed=2    unreachable=0    failed=0
        
5. 藉由 Vagrant 於本機測試 Playbook。

        $ vagrant up            # Boot and Play.
        
        $ vagrant provision     # Play only.