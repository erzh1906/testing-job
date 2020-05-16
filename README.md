# Setup DigitalOcean instances

# Install prerequisites:
  - Terraform [0.12.x](https://releases.hashicorp.com/terraform/0.12.25/terraform_0.12.25_linux_amd64.zip) 
  - New DigitalOcean account is recommended

Clone repository, install Ansible and related pip packages in your virtualenv

```sh
git clone https://github.com/erzh1906/testing-job.git
cd testing-job
pip install -r requirements.txt
```

# 1. Terraform

Change working directory

```sh
cd terraform
```

Copy tfvars example, use your own values and run terraform

```sh
cp main.tfvars.example main.tfvars
terraform apply -var-file="main.tfvars"
```

**Variables:**
  - `main_config:` Global variables for your Terraform managed infrastructure
    - `token:` DigitalOcean API token. Default `1234`
    - `public_key:` your SSH public key. Default `ssh-rsa abcdef`.
    - `region:` DigitalOcean region. Default `ams3`
    - `vpc_cidr:` IP address range for your VPC. Default `172.16.0.0/16`
  - `app_config:` Configuration for application droplets
    - `count:` Count of required instances. Default is `1`
    - `image:` DigitalOcean image ID or image slug. Default `centos-7-x64`
    - `size:` droplet size slug. Default `s-2vcpu-4gb`
  - `db_config:`
    - `image:` DigitalOcean image ID or image slug. Default `centos-7-x64`
    - `size:` droplet size slug. Default `s-2vcpu-4gb`
  - `volume_config:`
    - `size:` volume size in Gb. Default `50`
    - `fs_type:` volume filesystem type. `ext4` and `xfs` available. Default `xfs`

# 2. Ansible 

Change working directory

```sh
cd ansible
```

Copy inventory example, use your own IP addresses and values and run playbook

```sh
cp inventory.example.yml inventory.yml

ansible-playbook -i inventory.yml playbooks/all.yml -u root --key-file=/path/to/your/private/key.rsa
```

**Common variables:**

  - `initial_ssh_allowed_cidrs:` list of network CIDRs allowed to connect via SSH. Default `["0.0.0.0/0"]`

**MySQL variables:**

  - `mysql_version:` MySQL version. Default `5.7.30`
  - `mysql_server_id:` MySQL server-id parameter. Default `1` 
  - `mysql_datadir:` MySQL datadir. Default `/var/lib/mysql`
  - `mysql_max_connections:` MySQL max_connections parameter. Default `100`
  - `mysql_sql_mode:` MySQL sql_mode parameter. Default `""`
  - `mysql_innodb_buffer_pool_instances:` MySQL innodb_buffer_pool_instances parameter. Default `4`
  - `mysql_innodb_buffer_pool_size:` MySQL innodb_buffer_pool_size parameter. Default `128M`
  - `mysql_innodb_log_file_size:` MySQL innodb_log_file_size parameter. Default `64M`
  - `mysql_default_collation:` MySQL collation-server parameter. Default `utf8_general_ci`
  - `mysql_root_password:` MySQL root password. Default `35eTYXsN<wP>>Z=qm`
  - `mysql_databases:` List of MySQL databases and database owners (full permissions on database) in folowing format
  -  `- db_name:` database name. Example `tcg_db`
  -  `- db_user:` database username. Example `tcg_user`
  -  `- db_password:` database password. Example `GdacsV=_>8m<=T`

**Application variables:**

  - `tcg_mysql_host:` MySQL host IP address. Default `127.0.0.1`
  - `tcg_mysql_user:` MySQL host username. Default `tcg_user`
  - `tcg_mysql_database:` MySQL host database. Default `tcg_db`
  - `tcg_mysql_password:` MySQL host password. Default `tcg_password`

# Result

$ curl -v -X POST http://188.166.55.218:8084/v1/health/check
*   Trying 188.166.55.218:8084...
* TCP_NODELAY set
* Connected to 188.166.55.218 (188.166.55.218) port 8084 (#0)
> POST /v1/health/check HTTP/1.1
> Host: 188.166.55.218:8084
> User-Agent: curl/7.65.3
> Accept: */*
> 
* Mark bundle as not supporting multiuse
< HTTP/1.1 200 OK
< Access-Control-Allow-Credentials: true
< Access-Control-Allow-Headers: Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, X-Token, Token
< Access-Control-Allow-Methods: GET, POST, OPTIONS
< Date: Sat, 16 May 2020 21:50:34 GMT
< Content-Length: 54
< Content-Type: text/plain; charset=utf-8
< 
{"last_check":"2020-05-16 21:50:24","version":"1.40"}
* Connection #0 to host 188.166.55.218 left intact

# Notes 

  - Очень много времени ушло на получение идемпотентности роли MySQL + molecule test этой роли выполняется долго :(
  - Я мог расположить переменные в group_vars или host_vars. Но для простоты засунул все в один инвентори
  - Можно использовать ansible-vault, чтоб не светить пароли
  - Не хватило времени сделать dynamic inventory :(
  - К сожалению, некоторые запросы возвращали curl: (52) Empty reply from server без каких либо ошибок на стороне приложения и БД. Дебаг tcpdump-ом и strace-ом не принес результата
