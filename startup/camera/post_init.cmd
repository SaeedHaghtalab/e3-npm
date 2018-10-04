dbpf $(SYS)-$(DEV):DC-Tgt-SP 70

dbpf $(PREF):$(CAM)OBSROI-BinX 4
dbpf $(PREF):$(CAM)OBSROI-BinY 4

dbpf $(PREF):$(CAM)-DataType "UInt16"


# TimeStamps
dbpf $(PREF):$(CAM)-COM.TSEL 			$(SYS)-$(DEV):Time-I
dbpf $(PREF):$(CAM)-BSZ.TSEL 			$(SYS)-$(DEV):Time-I
dbpf $(PREF):$(CAM)FITS-Background_RBV.TSEL 	$(SYS)-$(DEV):Time-I
dbpf $(PREF):$(CAM)FITS-PeakAmplitude_RBV.TSEL 	$(SYS)-$(DEV):Time-I
dbpf $(PREF):$(CAM)FITS-PeakMu_RBV.TSEL 	$(SYS)-$(DEV):Time-I
dbpf $(PREF):$(CAM)FITS-PeakSigma_RBV.TSEL 	$(SYS)-$(DEV):Time-I
dbpf $(PREF):$(CAM)OBSIMAGE-ArrayData.TSEL 	$(SYS)-$(DEV):Time-I
dbpf $(PREF):$(CAM)FITS-Fit_RBV.TSEL 		$(SYS)-$(DEV):Time-I
dbpf $(PREF):$(CAM)FITS-Y_RBV.TSEL 		$(SYS)-$(DEV):Time-I

