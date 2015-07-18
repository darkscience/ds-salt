#{% if grains['os'] == "FreeBSD" %}:
#  {% set install_root = "/usr/local" %}
#{% endif %}

{% set install_root = "/usr/local" %}

ircd:
  user.present:
    - uid: 73

{{ install_root }}/etc/inspircd:
  file.recurse:
    - template: jinja
    - source: salt://inspircd/inspircd
    - user: ircd

{{ install_root }}/etc/inspircd/pki/certificate.crt:
  file.managed:
    - makedirs: True
    - contents_pillar: irc-ssl_cert
    - user: ircd

{{ install_root }}/etc/inspircd/pki/certificate.key:
  file.managed:
    - contents_pillar: irc-ssl_key
    - user: ircd

{{ install_root }}/etc/inspircd/{{ grains['host'] }}.conf:
  file.managed:
    - source: salt://inspircd/files/host_config
    - user: ircd

install:
   pkg.installed:
     - name: inspircd

service run:
  service.running:
    - name: inspircd
    - enable: True
    - restart: True
