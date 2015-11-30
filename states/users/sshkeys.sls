{% for usr in 'dijit','xlink','elric','derecho','narada','liothen' %}
  /home/{{usr}}/.ssh/authorized_keys:
    file.managed:
      - source: salt://users/keys/{{usr}}
      - makedirs: True
      - mode: 600
      - user: {{usr}}
      - group: {{usr}}
{% endfor %}

