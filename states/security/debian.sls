sshguard:
  pkg.latest

/etc/sysctl.conf:
  file.append:
    - text:
      - "# Disables the magic SysRq key"
      - "kernel.sysrq = 0"

/etc/security/access.conf:
  file.append:
    - text:
      - "-:wheel:ALL EXCEPT LOCAL"
