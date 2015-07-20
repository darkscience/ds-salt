freebsd-update cron:
  cron.present:
    - user: root
    - minute: 0
    - hour: 2

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://security/files/sshd
    - user: root
    - mode: 0600

