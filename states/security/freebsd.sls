freebsd-update cron:
  cron.present:
    - user: root
    - minute: 0
    - hour: 2

filewall config:
  file.managed:
    - name: /etc/pf.conf
    - source: salt://security/freebsd/firewall
    - user: root
    - group: wheel
    - mode: 0600

persistence:
  file.append:
    - name: /etc/rc.conf
    - source: salt://security/freebsd/rc.append
