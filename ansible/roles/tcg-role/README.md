Setup IMHIO Ltd TCG server
=========

Install and configure IMHIO Ltd TCG server

Role Variables
--------------

  - `tcg_mysql_host:` MySQL host IP address. Default `127.0.0.1`
  - `tcg_mysql_user:` MySQL host username. Default `tcg_user`
  - `tcg_mysql_database:` MySQL host database. Default `tcg_db`
  - `tcg_mysql_password:` MySQL host password. Default `tcg_password`

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
        - tcg-role
      vars:
        tcg_mysql_host: 127.0.0.1
        tcg_mysql_user: tcg_user
        tcg_mysql_database: tcg_db
        tcg_mysql_password: tcg_password
