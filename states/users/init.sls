{% for usr in 'evilb', 'dijit', 'scub' %}
{{ usr }}:
  group:
    - present
  user:
    - present
    - groups: ["wheel",{{ usr }}]
    - shell: /usr/local/bin/zsh
{% endfor %}

sudo:
  pkg.installed
   
/usr/local/etc/sudoers:
  file.managed:
    - source: salt://users/sudoers
