{% set install_root = pillar['path'] %}

{% for usr in 'dijit','kylef','derecho','elric','xlink','narada' %}
{{ usr }}:
  group:
    - present
  user:
    - present
    - groups: ["wheel",{{ usr }}]
    - shell: {{install_root}}/bin/zsh
  file.managed:
    - name: /home/{{ usr }}/.zshrc
    - source: salt://shells/files/zshrc
    - user: {{ usr }}
{% endfor %}

sudo:
  pkg.installed

{{install_root}}/etc/sudoers:
  file.managed:
    - source: salt://users/sudoers
