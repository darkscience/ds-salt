
ircd_user:
  user.present:
    - name: ircd
    - uid: 73

{{ pillar['path'] }}etc/inspircd:
  file.recurse:
    - template: jinja
    - source: salt://inspircd/inspircd
    - user: ircd

{{ pillar['path'] }}/etc/inspircd/pki/certificate.crt:
  file.managed:
    - makedirs: True
    - contents_pillar: irc-ssl_cert
    - user: ircd

{{ pillar['path'] }}etc/inspircd/pki/certificate.key:
  file.managed:
    - contents_pillar: irc-ssl_key
    - user: ircd

{{ pillar['path'] }}etc/inspircd/{{ grains['host'] }}.conf:
  file.managed:
    - template: jinja
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
  pkg.installed:
    - name: inspircd
init script:
  file.managed:
    - name: /etc/init.d/inspircd
    - source: salt://inspircd/files/sysv-init
systemd unit:
  file.managed:
    - name: /lib/systemd/system/inspircd.service
    - source: salt://inspircd/files/systemd-unit
{% endif %}

/var/log/inspircd:
  file.directory:
    - user: ircd

/var/run/inspircd:
  file.directory:
    - user: ircd


inspircd service:
  service.running:
    - name: inspircd
    - enable: True
    - restart: True
