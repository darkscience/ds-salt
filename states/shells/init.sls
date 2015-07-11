zsh:
  pkg.installed

/etc/skel/.zshrc:
  file.managed:
    - source: salt://shells/zshrc

https://github.com/robbyrussell/oh-my-zsh.git:
  git.latest:
    - target: /usr/local/share/oh-my-zsh

/usr/local/share/oh-my-zsh:
  file.directory:
    - user: dijit
    - group: dijit
    - mode: 777
    - recurse:
      - user
      - group
      - mode
