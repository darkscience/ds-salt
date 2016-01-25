zsh:
  pkg.installed

/etc/skel/.zshrc:
  file.managed:
    - source: salt://shells/files/zshrc

https://github.com/robbyrussell/oh-my-zsh.git:
  git.latest:
    - target: /usr/local/share/oh-my-zsh

/usr/local/share/oh-my-zsh:
  file.directory:
    - user: root
    - group: {{pillar['admin_group']}}
    - recurse:
      - user
      - group
