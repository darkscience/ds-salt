# DarkScience Salt configurations

Currently only supports FreeBSD and debian.
for porting, please look at:

 * `states/inspircd/init.sls`
 * `states/edit/vim.sls`
 * `states/security/init.sls`

Since we support linux now, we should add package names as pillar data.

#Notes:

to ensure ports is installed on a machine please run:
`salt '*' ports.update extract=True`

Compilation if inspircd will occur on IRC nodes.
This took 10 minutes on my pretty powerful machine at home.

use:
`salt -t 1200 '*' state.highstate` when first running a node.

# I just want an irc node.
Well, you shouldn't be using this _only_ for insp, but if you need to: `salt -t 1200 'nodename' state.apply inspircd` should do the trick.

# Configuring a master:
Stick this in your `/etc/salt/master` file.
    fileserver_backend:
     - git
    gitfs_remotes:
    - git://github.com/darkscience/ds-salt.git
