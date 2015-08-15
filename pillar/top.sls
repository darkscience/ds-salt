base:
  "E@^(celadon|cinnabar|cthulhu|indigo|lavender|saffron).darkscience.net$":
    - irc.ssl
    - irc.passwords
    - irc.opers
    - admin.dijit
  'salt-minion.e3.drk.sc':
    - irc.ssl
    - irc.passwords
    - irc.opers
    - admin.dijit
  '*':
    - os
  "debian-minion.e3.drk.sc":
    - irc.ssl_unencrypted
    - irc.passwords_unencrypted
    - irc.opers_unencrypted
    - admin.dijit
  "verus.darkscience.net":
    - admin.derecho
  "pallet.darchoods.net":
    - admin.darchoods
