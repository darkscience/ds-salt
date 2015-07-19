freebsd-update cron:
  cron.present:
    - user: root
    - minute: 0
    - hour: 2
