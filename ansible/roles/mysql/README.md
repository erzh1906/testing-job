Setup MySQL 5.7 server
=========

Install and configure MySQL 5.7 server

Role Variables
--------------

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

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
        - mysql
      vars:
        mysql_version: 5.7.30
        mysql_server_id: 1
        mysql_datadir: /var/lib/mysql
        mysql_max_connections: 100
        mysql_sql_mode: ""
        mysql_innodb_buffer_pool_instances: 4
        mysql_innodb_buffer_pool_size: 128M
        mysql_innodb_log_file_size: 64M
        mysql_default_collation: utf8_general_ci
        mysql_root_password: 35eTYXsN<wP>>Z=qm
        mysql_databases:
          - db_name: tcg_db
            db_user: tcg_user
            db_password: GdacsV=_>8m<=T

