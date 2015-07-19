# DarkScience Salt configurations

Currently only supports FreeBSD.
for porting, please look at:

 * `states/inspircd/init.sls`
 * `states/edit/vim.sls`


#Notes:

to ensure ports is installed on a machine please run:
`salt '*' ports.update extract=True`

Compilation if inspircd will occur on IRC nodes.
This took 10 minutes on my pretty powerful machine at home.

use:
`salt -t 1200 '*' state.highstate` when first running a node.
