evilb:
  user.present:
    - uid: 1002
    - gid: 1002
    - home: /home/evilb
    - shell: /usr/local/bin/zsh
    - groups: ["wheel","evilb"]
  group.present:
    - gid: 1002

      
