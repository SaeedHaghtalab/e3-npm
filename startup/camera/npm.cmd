require ADProsilica
require admisc
require busy
require sequencer
require calc

epicsEnvSet("TOP",     "$(E3_CMD_TOP)/../..")
epicsEnvSet("DB_TOP",  "$(TOP)/db")
epicsEnvSet("ST_TOP",  "$(TOP)/startup/camera")

afterInit("epicsThreadSleep 5")


< $(ST_TOP)/npm-01_env.cmd

< $(ST_TOP)/envset

< $(ST_TOP)/npmEVR.cmd

##############################################################################
### Vertical Orientation

epicsEnvSet("PREFIX",           "$(VPREF)")
epicsEnvSet("CAM",              "$(VCAM)")
epicsEnvSet("CAMIP",            "$(VCAMIP)")
epicsEnvSet("OFFLENS_VAL",      "5.45")
epicsEnvSet("DIM",              "0")

< $(ST_TOP)/npmAD.cmd


##############################################################################
### Horizontal Orientation

epicsEnvSet("PREFIX",           "$(HPREF)")
epicsEnvSet("CAM",              "$(HCAM)")
epicsEnvSet("CAMIP",            "$(HCAMIP)")
epicsEnvSet("OFFLENS_VAL",      "5.50")
epicsEnvSet("DIM",              "1")

< $(ST_TOP)/npmAD.cmd

##############################################################################

startPVAServer

