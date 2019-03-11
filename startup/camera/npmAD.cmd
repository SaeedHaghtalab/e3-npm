### Plugin property names, R macros in area detector
epicsEnvSet("PROC",        "$(CAM)PROC")	 # PROCESS PLUGIN
epicsEnvSet("ROI",         "$(CAM)ROI")		 # ROI plugin
epicsEnvSet("STATS",       "$(CAM)STATS")	 # STATS PLUGIN
epicsEnvSet("FITS",        "$(CAM)FITS")         # Fits Plugin
epicsEnvSet("OBSROI",      "$(CAM)OBSROI")	 # Observer ROI plugin
epicsEnvSet("OBSIMAGE",    "$(CAM)OBSIMAGE")	 # Observer StdArrays plugin
epicsEnvSet("OBSPVAIMAGE", "$(CAM)OBSPVAIMG")	 # Observer PVa plugin
epicsEnvSet("SLOWPROC",    "$(CAM)SLOWPROC")     # Slow observer processing plugin
epicsEnvSet("SLOWIMG",     "$(CAM)SLOWIMG")      # Slow observer StdArrays plugin


## Camera initialization and loading records, by default enable array callbacks and set UInt16 datatype
prosilicaConfig("$(CAM)", "$(CAMIP)", $(QSIZE))
dbLoadRecords("prosilica.db", "P=$(PREFIX):, R=$(CAM)-, PORT=$(CAM), ADDR=0, TIMEOUT=1")

## Process plugin initialization and loading records, by default enable callbacks and set UInt16 datatype
NDProcessConfigure("$(PROC)", $(QSIZE), 0, "$(CAM)", 0, 0, 0)
dbLoadRecords("NDProcess.template", "P=$(PREFIX), R=:$(PROC)-, PORT=$(PROC), ADDR=0, TIMEOUT=1, NDARRAY_PORT=$(CAM), ENABLED=1")

## Region of interest plugin initialization and loading records, by default enable callbacks, set UInt16 on datatype and UInt32 datatypoeout, set binx and biny to 4
NDROIConfigure("$(ROI)", $(QSIZE), 0, "$(PROC)", 0, 0, 0)
dbLoadRecords("NDROI.template", "P=$(PREFIX), R=:$(ROI)-, PORT=$(ROI), ADDR=0, TIMEOUT=1, NDARRAY_PORT=$(PROC), ENABLED=1, DATATYPEOUT=7")

## Statistics plugin initialization and loading records, by default enable callbacks and set UInt16 datatype
NDStatsConfigure("$(STATS)", $(QSIZE), 0, "$(ROI)", 0, 0, 0)
dbLoadRecords("NDStats.template", "P=$(PREFIX), R=:$(STATS)-, PORT=$(STATS), ADDR=0, TIMEOUT=1, NDARRAY_PORT=$(ROI), NCHANS=$(NCHANS), HIST_SIZE=$(HISTSIZE), XSIZE=$(XSIZE), YSIZE=$(YSIZE), COMPUTE_STATISTICS=0, COMPUTE_CENTROID=1, ENABLED=1")

## Fits plugin initialization and loading records, by default enable callbacks and set UInt16 datatype
NDFitsConfigure("$(FITS)", $(QSIZE), 0, "$(ROI)", 0, $(NUM_PEAKS), 0, 0, 0)
# Link data path from RBV of Background, Mu, Sigma and Amplitude to setpoint PVs
# and set macros on the setpoints PVs FLNKs to allow further data processing
dbLoadRecords("NDFits.db", "P=$(PREFIX),R=:$(FITS)-, PORT=$(FITS), ADDR=0,TIMEOUT=1, XSIZE=$(XSIZE), YSIZE=$(YSIZE), NDARRAY_PORT=$(ROI), ENABLED=1, BACKGROUND_ACTUAL_FLNK=$(PREFIX):$(CAM)-BCKGRND-BUFFER")
dbLoadRecords("NDFitsN.db", "P=$(PREFIX),R=:$(FITS)-, PORT=$(FITS), ADDR=0, TIMEOUT=1, AMPLITUDE_ACTUAL_FLNK=$(PREFIX):$(CAM)-AMP-BUFFER, MU_ACTUAL_FLNK=$(PREFIX):$(CAM)-COM, SIGMA_ACTUAL_FLNK=$(PREFIX):$(CAM)-BSZ")

## Region of interest plugin initialization and loading records, set UInt16 on datatype and UInt32 datatypoeout, set binx and biny to 4
NDROIConfigure("$(OBSROI)", $(QSIZE), 0, "$(PROC)", 0, 0, 0)
dbLoadRecords("NDROI.template", "P=$(PREFIX), R=:$(OBSROI)-, PORT=$(OBSROI), ADDR=0, TIMEOUT=1, NDARRAY_PORT=$(PROC), ENABLED=1, BINX=4, BINY=4, DATATYPEOUT=5")

## Image initialization and loading records
NDStdArraysConfigure("$(OBSIMAGE)", $(QSIZE), 0, "$(OBSROI)", 0, 0)
dbLoadRecords("$(DB_TOP)/npmNDStdArrays.template", "P=$(PREFIX),R=:$(OBSIMAGE)-,PORT=$(OBSIMAGE),ADDR=0,TIMEOUT=1,TYPE=Int32, FTVL=LONG,NELEMENTS=$(NELEM),NDARRAY_PORT=$(OBSROI),NDARRAY_ADDR=0")

## PVA Image initialization and loading records
NDPvaConfigure("$(OBSPVAIMAGE)", $(QSIZE), 0, "$(OBSROI)", 0, "$(PREFIX):$(OBSPVAIMAGE)", 0)
dbLoadRecords("NDPva.template", "P=$(PREFIX), R=:$(OBSPVAIMAGE)-, PORT=$(OBSPVAIMAGE), ADDR=0, TIMEOUT=1, NDARRAY_PORT=$(OBSROI)")

## Processing plugin to reduce image rate (enabled filter with averaging to produce 1Hz rate)
NDProcessConfigure("$(SLOWPROC)", $(QSIZE), 0, "$(OBSROI)", 0, 0, 0)
dbLoadRecords("NDProcess.template","P=$(PREFIX),R=:$(SLOWPROC)-,PORT=$(SLOWPROC),ADDR=0,TIMEOUT=1,NDARRAY_PORT=$(OBSROI)")

## Slow image initialization and loading records
NDStdArraysConfigure("$(SLOWIMG)", $(QSIZE), 0, "$(SLOWPROC)", 0, 0)
dbLoadRecords("NDStdArrays.template","P=$(PREFIX),R=:$(SLOWIMG)-,PORT=$(SLOWIMG),ADDR=0,TIMEOUT=1,TYPE=Int32,FTVL=LONG,NELEMENTS=509232,NDARRAY_PORT=$(SLOWPROC),NDARRAY_ADDR=0")



###### Custom Databases
dbLoadRecords("$(DB_TOP)/npmObjPosParams.template", "PREFIX=$(PREFIX), CAM=$(CAM), OFFLENS_VAL=$(OFFLENS_VAL), FOCLEN_VAL=$(FOCLEN), OFFREF_VAL=$(OFFREF), LENSPOS_PV=$(PREFIX):Mtr.RBV, EGU=$(MOTOR_EGU=mm), PIXELSIZE=$(PIXELSIZE), DIM=$(DIM)")

dbLoadRecords("$(DB_TOP)/npmRollingBuffer.template", "PREFIX=$(PREFIX), CAM=$(CAM), BUFSIZE=$(ROLLINGBUFSIZE), PARAM=AMP, PARAM_PV=$(PREFIX):$(FITS)-PeakAmplitudeActual, PREC=$(AMP_PREC)")

dbLoadRecords("$(DB_TOP)/npmCenterOfMass.template", "PREFIX=$(PREFIX), CAM=$(CAM), BUFSIZE=$(ROLLINGBUFSIZE), MU_PV=$(PREFIX):$(FITS)-PeakMuActual, COM_PREC=$(COM_PREC), MU_PREC=$(MU_PREC)")

dbLoadRecords("$(DB_TOP)/npmBeamSize.db", "PREFIX=$(PREFIX), CAM=$(CAM), BUFSIZE=$(ROLLINGBUFSIZE), SIGMA_PV=$(PREFIX):$(FITS)-PeakSigmaActual, BSZ_PREC=$(BSZ_PREC), SIGMA_PREC=$(SIGMA_PREC)")

dbLoadRecords("$(DB_TOP)/npmRollingBuffer.template", "PREFIX=$(PREFIX), CAM=$(CAM), BUFSIZE=$(ROLLINGBUFSIZE), PARAM=BCKGRND, PARAM_PV=$(PREFIX):$(FITS)-BackgroundActual, PREC=$(BCKGRND_PREC)")

#WLA - Calling database for Scale settings
dbLoadRecords("$(DB_TOP)/npmScaleSettings.template", "PREFIX=$(PREFIX), CAM=$(CAM)")

< $(ST_TOP)/post_init.cmd

