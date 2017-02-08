# Chef Lab | chusiang


Infrastructure of this lab.
           
    +----------------------------------------------------+
    | +------------------------------------------------+ |
    | | +---------------+          +-----------------+ | |
    | | |  knife-solo   |          | chef-solo.local | | |
    | | | (33.33.33.11) | -------> |  (33.33.33.31)  | | |
    | | +---------------+          +-----------------+ | |
    | |            \                                   | |
    | |        Guest OS (Vagrant + Virtualbox)         | |
    | +--------------\---------------------------------+ |
    |                 \                                  |
    |          Host OS (http://127.0.0.1:8888)           |
    +----------------------------------------------------+

## zabbix-agent

- run list and custom vars.


    ```json
    {
      "run_list": [ "recipe[zabbix-agent]" ],
      "zabbix_agent": {
        "server": "zabbix.example.tw",
        "server_active": "zabbix.example.tw"
      }
    }
    ```
    
- Result on **chef-solo.local** instance.

    ```
    $ cat /etc/zabbix/zabbix_agentd.conf
    ...
    Server=zabbix.example.tw
    ServerActive=zabbix.example.tw
    Hostname=chef-solo.local
    ...
    ```