{% if grains['os'] != 'FreeBSD' %}
{{pillar['admin_group']}}:
  group.present:
    - gid: 305
{% endif %}

{% for usr in 'dijit','kylef','derecho','elric','xlink','narada','liothen' %}
{{ usr }}:
  group:
    - present
  user:
    - present
    - groups: [{{pillar['admin_group']}},{{ usr }}]
    - shell: {{pillar['path']}}/bin/zsh
  file.managed:
    - name: /home/{{ usr }}/.zshrc
    - source: salt://shells/files/zshrc
    - user: {{ usr }}
{% endfor %}

{% for usr in 'dijit','kylef','derecho','elric','xlink','narada','liothen' %}
/home/{{usr}}/.ssh/authorized_keys:
  file.managed:
    - source: salt://users/keys/{{usr}}
    - makedirs: True
    - mode: 600
    - user: {{usr}}
    - group: {{usr}}
{% endfor %}

sudo:
  pkg.installed

{{pillar['path']}}/etc/sudoers:
  file.managed:
    - template: jinja
    - source: salt://users/sudoers
