{% set install_root = pillar['path'] %}

ircd_user:
  user.present:
    - name: ircd
    - uid: 73

{{ install_root }}:
  file.recurse:
    - template: jinja
    - source: salt://inspircd/inspircd
    - user: ircd

{{ install_root }}/pki/certificate.crt:
  file.managed:
    - makedirs: True
    - contents_pillar: irc-ssl_cert
    - user: ircd

{{ install_root }}/pki/certificate.key:
  file.managed:
    - contents_pillar: irc-ssl_key
    - user: ircd

{{ install_root }}/{{ grains['host'] }}.conf:
  file.managed:
    - source: salt://inspircd/files/host_config
    - user: ircd

{% if grains['os'] == 'FreeBSD' %}
inspircd install:
  ports.installed:
    - name: irc/inspircd
    - options:
    - GNUTLS: True
{% elif grains['os'] == 'Debian' %}
inspircd install:
  #FIXME: manual install instructions
{% endif %}

inspircd service:
  service.running:
    - name: inspircd
    - enable: True
    - restart: True
