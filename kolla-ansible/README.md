# Kolla-Ansible Workshop Hsinchu - NCTU | chusiang

> 活動網址：https://www.meetup.com/OpenStack-Taiwan-User-Group/events/242606941/

本場次為一系列 Kolla-Ansible Workshop 在新竹場次的活動訊息。

本次 Workshop 中講師將介紹透過 Kolla-Ansible 的部署方式實際帶領參加者部署基於 Kolla-Ansible AIO (All in One) 的 OpenStack 環境。

## Workshop 活動簡介 

OpenStack Kolla-Ansible 是目前部署 OpenStack 相當好用的工具，藉由 Kolla Project 中 build 好的 OpenStack service docker images 透過 Ansible 部署到實體主機中。 

Kolla-Ansible 擁有以下幾點相當重要的特性：

1. 快速部署。
2. 容易擴展。
3. 簡單易用。
4. 易於維運。

Kolla-Ansible 解決了許多過去部署 OpenStack 碰到的難題，擁有豐富經驗的講師郭靖 Gene Kuo 將會詳細的解說 Kolla-Ansible 優異之處並帶領參加學員學習完成基於 Kolla-Ansible 的 OpenStack 環境，歡迎對於 Kolla-Ansible 想要學習了解的社群夥伴朋友一同參加這次精彩的 Workshop。

## 學習目標

參加者可以學到：

1. Kolla-Ansible 基本介紹 
2. Kolla-Ansible 部署實作

## 預備知識： 

1. OpenStack 基礎架構認知 (Nova, Keystone, Neutron, Cinder…. 等核心元件) 
2. Ansible 基礎暸解 

可透過閱讀以下文章預先學習：

1. https://docs.openstack.org/security-guide/introduction/introduction-to-openstack.html 
2. http://docs.ansible.com/ansible/latest/intro.html 

強烈建議參加者攜帶能夠安裝 Ubuntu Linux 虛擬機的筆電 (硬體要求 2 core/8GB RAM) 或是使用已經安裝 Ubuntu Linux 作業系統筆電。

* 活動場地：新竹 交通大學 電子資訊大樓二樓蘭城廳 
* 時間：9/9 下午 13:30-16:30

## 講者簡介

**郭靖 Gene Kuo**

交通大學電子系學生，曾經在 OpenStack Foundation 擔任 intern。有 3 年 OpenStack 相關經驗，現為 OpenStack ATC, AUC。

## 主辦單位

OpenStack Taiwan User Group

----

# Note of Kolla-Ansible Workshop

> https://hackmd.io/s/BycDsf4OZ

## 安裝套件

```
sudo apt-get update
sudo apt-get install python-dev libffi-dev gcc libssl-dev python-pip -y
sudo pip install -U pip
sudo pip install -U ansible kolla-ansible
sudo cp -r /usr/local/share/kolla-ansible/etc_examples/kolla /etc/kolla/
cp /usr/local/share/kolla-ansible/ansible/inventory/* .
```

## 更改設定檔

設定檔在 `/etc/kolla/globals.yml`。

1. `base_distro: ubuntu`
`kolla_install_type: source`
~~`openstack_release: 4.0.2`~~
`openstack_release: 4.0.0`
![](https://i.imgur.com/vJSbFpX.png)

1. `kolla_internal_vip_address` 請填入目前操作的 server ip address。
![](https://i.imgur.com/0pgYEkv.png)

1. docker repo server 在 `172.24.0.100:4000`。
![](https://i.imgur.com/B2ZG5kk.png)

1. `enable_haproxy: "no"`
![](https://i.imgur.com/aRlPApM.png)

1. `network_interface enp8s0`
1. `external_interface enp3s0f0`
![](https://i.imgur.com/aQbEld4.jpg)
`

## 產生密碼

```
sudo kolla-genpwd
```

## 開始安裝

```
sudo kolla-ansible -i all-in-one bootstrap-servers
sudo kolla-ansible -i all-in-one prechecks
sudo kolla-ansible -i all-in-one deploy
sudo kolla-ansible -i all-in-one post-deploy
```

1. bootstrap-servers: 安裝必要套件。
2. prechecks: 會做些基本檢查，因應有無開啟 HA Proxy 有所不同。
3. deploy: 部署 xxx。
4. post-deploy: 產生認證。

## Login the OpenStack

* username: `admin`
* password: find OS_PASSWORD in admin-openrc.sh

> 註：第一次登入會有點慢。

![](https://i.imgur.com/vV7zF6L.png)

OpenStack 認證資訊請參考 `/etc/kolla/admin-openrc.sh`。

```
ubuntu@kolla-ansible:~$ cat /etc/kolla/admin-openrc.sh
export OS_PROJECT_DOMAIN_NAME=default
export OS_USER_DOMAIN_NAME=default
export OS_PROJECT_NAME=admin
export OS_TENANT_NAME=admin
export OS_USERNAME=admin
export OS_PASSWORD=GYVlT8L9gtzllgtHAl2vq7d4RlX7VgCLk9N753hv
export OS_AUTH_URL=http://10.0.2.15:35357/v3
export OS_INTERFACE=internal
export OS_IDENTITY_API_VERSION=3
```

## 建立第一個網路

一般建議使用使用自己規劃的網路架構。

![](https://i.imgur.com/hh2bRv2.png)


1. 安裝 python-neutronclient。

    ```
    sudo pip install python-neutronclient
    source /etc/kolla/admin-openrc.sh
    ```

2. 建立網路：請使用自己所想的 IP 。

    ```
    neutron net-create ext-net --router:external \
          --provider:physical_network physnet1 \
          --provider:network_type flat
    neutron CLI is deprecated and will be removed in the future. Use openstack CLI instead.
    Created a new network:
    +---------------------------+--------------------------------------+
    | Field                     | Value                                |
    +---------------------------+--------------------------------------+
    | admin_state_up            | True                                 |
    | availability_zone_hints   |                                      |
    | availability_zones        |                                      |
    | created_at                | 2017-09-09T13:24:53Z                 |
    | description               |                                      |
    | id                        | f9c08af7-c0f3-4dda-98aa-4edcca4c34b9 |
    | ipv4_address_scope        |                                      |
    | ipv6_address_scope        |                                      |
    | is_default                | False                                |
    | mtu                       | 1500                                 |
    | name                      | ext-net                              |
    | project_id                | 2bda97beeeb4412caed6d331e86f45e6     |
    | provider:network_type     | flat                                 |
    | provider:physical_network | physnet1                             |
    | provider:segmentation_id  |                                      |
    | revision_number           | 3                                    |
    | router:external           | True                                 |
    | shared                    | False                                |
    | status                    | ACTIVE                               |
    | subnets                   |                                      |
    | tags                      |                                      |
    | tenant_id                 | 2bda97beeeb4412caed6d331e86f45e6     |
    | updated_at                | 2017-09-09T13:24:54Z                 |
    +---------------------------+--------------------------------------+


    neutron subnet-create ext-net --name ext-subnet \
     --allocation-pool start=192.168.1.150,end=192.168.1.200 \
     --disable-dhcp --gateway 192.168.1.1 192.168.1.0/24
     neutron CLI is deprecated and will be removed in the future. Use openstack CLI instead.
    Created a new subnet:
    +-------------------+----------------------------------------------------+
    | Field             | Value                                              |
    +-------------------+----------------------------------------------------+
    | allocation_pools  | {"start": "192.168.1.150", "end": "192.168.1.200"} |
    | cidr              | 192.168.1.0/24                                     |
    | created_at        | 2017-09-09T13:26:04Z                               |
    | description       |                                                    |
    | dns_nameservers   |                                                    |
    | enable_dhcp       | False                                              |
    | gateway_ip        | 192.168.1.1                                        |
    | host_routes       |                                                    |
    | id                | 96356bb4-f43b-4e95-95ab-4ad3eb59a783               |
    | ip_version        | 4                                                  |
    | ipv6_address_mode |                                                    |
    | ipv6_ra_mode      |                                                    |
    | name              | ext-subnet                                         |
    | network_id        | f9c08af7-c0f3-4dda-98aa-4edcca4c34b9               |
    | project_id        | 2bda97beeeb4412caed6d331e86f45e6                   |
    | revision_number   | 2                                                  |
    | service_types     |                                                    |
    | subnetpool_id     |                                                    |
    | tags              |                                                    |
    | tenant_id         | 2bda97beeeb4412caed6d331e86f45e6                   |
    | updated_at        | 2017-09-09T13:26:04Z                               |
    +-------------------+----------------------------------------------------+
    ```

1. Done.
![](https://i.imgur.com/ODc03h2.png)


名詞解釋：

* Instance: 我們一般所指的 VM，在 Cloud computing  中我們稱呼為 instances。
* Flavors: 定義 CPU、Memory、Disk 等資源的設定。

## Troubleshooting

If you changed the config file, you have to destroy all old data an re-run bootstrap and etc.

```
sudo kolla-ansible -i all-in-one destroy --yes-i-really-really-mean-it
```

因為自己編好的 image 有些問題，所以可以改用 Docker Hub 上的 image。

將 `globals.yml` 裡面的 `openstack_release` 改為 `4.0.0`，並將 `docker_registry` 整行註解起來，接下來就會從Docker Hub 下載 image 了。

> https://hub.docker.com/u/kolla/

## 自己編 image

```
git clone https://github.com/openstack/kolla
cd kolla
sudo tools/build.py -b ubuntu -t source --push --registry YOUR_REGISTRY_IP
```

* -b base_distro
* -t install_type


----

## Other 

### Lab with Virtualbox

1. 可以在 VM 裡安裝成功，但要記得開 2 張網卡，一張對外用。


### Ansible Store

1. Deploying App Coffee Mug: https://ansible-inc.myshopify.com/collections/frontpage/products/deploying-an-app-coffee-mug

   > Diner style, white coffee mug with the quote: "While you watch me drink this, I'm deploying an app."

### Kubernetes Day

Kolla-Kuberenetes
Kubernetes Helm有興趣的話可以去聽白凱仁的演講
* https://day.ithome.com.tw/kubernetes/
或是去9/21 inwinStack跟工研院辦的找他聊天
* https://www.accupass.com/event/1708310828493071202320

### Vagrant

藉由 Vagrant (Virtualbox) 模擬操作環境。

> see the `Vagrantfile`.
