Initial server setup
=========

Install and configure firewalld

Role Variables
--------------

  - `initial_ssh_allowed_cidrs:` list of network CIDRs allowed to connect via SSH. Default `["0.0.0.0/0"]`

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
        - initial
      vars:
        initial_ssh_allowed_cidrs:
          - 192.168.0.0/24
          - 8.8.8.8/32
