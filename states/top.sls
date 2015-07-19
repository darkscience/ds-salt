base:
  '[celadon,cinnabar,indigo,cthulhu,saffron,lavender].darkscience.net':
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
