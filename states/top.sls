base:
  'E@^(celadon|cinnabar|cthulhu|indigo|lavender|saffron).darkscience.net$':
    - shells
    - python
    - users
    - users.sshkeys
    - edit.vim
    - inspircd
    - security
  'salt-minion.e3.drk.sc':
    - shells
    - python
    - users
    - users.sshkeys
    - edit.vim
    - inspircd
    - security

implode:
  'salt-minion.e3.drk':
    - rm_users.evilb
