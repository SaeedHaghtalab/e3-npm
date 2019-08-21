require npm, 1.0.0



epicsEnvSet("SECSUB",   "LEBT-020") 
epicsEnvSet("HCAMIP",   "")
epicsEnvSet("VCAMIP",   "")
epicsEnvSet("HCAM",     "HCAM")         // Horizontal plane camera name
epicsEnvSet("VCAM",     "VCAM")         // Vertical plane camera name


####### Load Image acquisition

# Pass "DISABLE_VER=#" or "DISABLE_HOR=#" if you want to comment out loading one plane.
iocshLoad("$(npm_DIR)/npm.iocsh", "SECSUB=$(SECSUB), HCAMIP=$(HCAMIP), VCAMIP=$(VCAMIP), HCAM=$(HCAM), VCAM=$(VCAM)")
