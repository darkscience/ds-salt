/etc/ssh/sshd_config:
  file.managed:
    - source: salt://security/files/sshd
    - user: root
    - mode: 0600

