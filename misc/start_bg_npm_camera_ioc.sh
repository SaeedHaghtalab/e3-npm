#! /bin/bash
source /epics/base-3.15.5/require/3.0.0/bin/setE3Env.bash

/usr/bin/procServ -f -n npmcam -L /var/log/procServ/npm/out-npmcam.log -i ^C^D -x ^Q -c /var/run/procServ/npm 2000 /epics/base-3.15.5/require/3.0.0/bin/iocsh.bash /home/npmuser/e3-npm/startup/camera/npm.cmd

