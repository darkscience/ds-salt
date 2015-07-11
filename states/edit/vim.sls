vim:
  pkg:
    {% if grains['os'] == 'FreeBSD' %}
    - name: vim-lite
    {% endif %}
    - installed

git:
  pkg.installed

