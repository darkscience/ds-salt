{% for usr in 'dijit','kylef','derecho','elric','xlink','narada' %}
{{ usr }}:
  group:
    - present
  user:
    - present
    - groups: ["wheel",{{ usr }}]
    - shell: /usr/local/bin/zsh
  file.managed:
    - name: /home/{{ usr }}/.zshrc
    - source: salt://shells/files/zshrc
    - user: {{ usr }}
{% endfor %}

sudo:
  pkg.installed
   
/usr/local/etc/sudoers:
  file.managed:
    - source: salt://users/sudoers
