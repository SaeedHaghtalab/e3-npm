require npm, 1.0.0
require mrfioc2, 2.2.0-rc7
require ADProsilica,10bfc26
require admisc,2.0.0
require busy,1.7.2-e45eda2
require sequencer,2.2.7
require calc,3.7.3


epicsEnvSet("SECSUB",   "LEBT-020") 
epicsEnvSet("HCAMIP",   "")
epicsEnvSet("VCAMIP",   "")
epicsEnvSet("HCAM",     "HCAM")         // Horizontal plane camera name
epicsEnvSet("VCAM",     "VCAM")         // Vertical plane camera name


####### Load Image acquisition

# Pass "DISABLE_VER=#" or "DISABLE_HOR=#" if you want to comment out loading one plane.
iocshLoad("$(npm_DIR)/npm.iocsh", "SECSUB=$(SECSUB), HCAMIP=$(HCAMIP), VCAMIP=$(VCAMIP), HCAM=$(HCAM), VCAM=$(VCAM)")
