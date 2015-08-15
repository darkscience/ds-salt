{% if grains['os'] == 'FreeBSD' %}
path: "/usr/local/"
admin_group: "wheel"
{% elif grains['os'] == 'Debian' %}
path: "/"
admin_group: "systems"
{% endif %}
