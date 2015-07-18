base:
  'salt-minion.e3.drk.sc':
    - shells
    - python
    - users
    - users.sshkeys
    - edit.vim
    - inspircd

implode:
  'salt-minion.e3.drk':
    - rm_users.evilb
