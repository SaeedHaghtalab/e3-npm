require npm, 1.0.0
require mrfioc2, 2.2.0-rc5


epicsEnvSet("SECSUB",   "LEBT-010") 
epicsEnvSet("HCAMIP",   "172.16.60.83")
epicsEnvSet("VCAMIP",   "172.16.60.84")
epicsEnvSet("HCAM",     "HCAM")         // Horizontal plane camera name
epicsEnvSet("VCAM",     "VCAM")         // Vertical plane camera name

epicsEnvSet("SYS"       "FEB-030Row:PBI")
epicsEnvSet("DEV"       "EVR-009")
epicsEnvSet("EVRPCIID", "05:00.0")

####### Load Image acquisition

# Pass "DISABLE_VER=#" or "DISABLE_HOR=#" if you want to comment out loading one plane.
iocshLoad("$(npm_DIR)/npm.iocsh", "SECSUB=$(SECSUB), HCAMIP=$(HCAMIP), VCAMIP=$(VCAMIP), HCAM=$(HCAM), VCAM=$(VCAM)")



####### Load Timing

iocshLoad("$(npm_DIR)/npmEVR.iocsh", "SYS=$(SYS), DEV=$(DEV), EVRPCIID=$(EVRPCIID)")

# TimeStamps
afterInit("dbpf $(SECSUB):$(HCAM)-COM.TSEL                   $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(SECSUB):$(HCAM)-BSZ.TSEL                   $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(SECSUB):$(HCAM)FITS-Background_RBV.TSEL    $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(SECSUB):$(HCAM)FITS-PeakAmplitude_RBV.TSEL $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(SECSUB):$(HCAM)FITS-PeakMu_RBV.TSEL        $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(SECSUB):$(HCAM)FITS-PeakSigma_RBV.TSEL     $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(SECSUB):$(HCAM)OBSIMAGE-ArrayData.TSEL     $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(SECSUB):$(HCAM)FITS-Fit_RBV.TSEL           $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(SECSUB):$(HCAM)FITS-Y_RBV.TSEL             $(SYS)-$(DEV):Time-I.TIME")

afterInit("dbpf $(SECSUB):$(VCAM)-COM.TSEL                   $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(SECSUB):$(VCAM)-BSZ.TSEL                   $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(SECSUB):$(VCAM)FITS-Background_RBV.TSEL    $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(SECSUB):$(VCAM)FITS-PeakAmplitude_RBV.TSEL $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(SECSUB):$(VCAM)FITS-PeakMu_RBV.TSEL        $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(SECSUB):$(VCAM)FITS-PeakSigma_RBV.TSEL     $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(SECSUB):$(VCAM)OBSIMAGE-ArrayData.TSEL     $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(SECSUB):$(VCAM)FITS-Fit_RBV.TSEL           $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(SECSUB):$(VCAM)FITS-Y_RBV.TSEL             $(SYS)-$(DEV):Time-I.TIME")
