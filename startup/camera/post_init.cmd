afterInit("dbpf $(PREFIX):$(CAM)-TriggerMode 1")
afterInit("dbpf $(PREFIX):$(CAM)-BinX 4")
afterInit("dbpf $(PREFIX):$(CAM)-BinY 4")
afterInit("dbpf $(PREFIX):$(CAM)-DataType "UInt16"")

# TimeStamps
afterInit("dbpf $(PREFIX):$(CAM)-COM.TSEL 			 $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(PREFIX):$(CAM)-BSZ.TSEL 			 $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(PREFIX):$(CAM)FITS-Background_RBV.TSEL 	 $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(PREFIX):$(CAM)FITS-PeakAmplitude_RBV.TSEL $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(PREFIX):$(CAM)FITS-PeakMu_RBV.TSEL 	 $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(PREFIX):$(CAM)FITS-PeakSigma_RBV.TSEL 	 $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(PREFIX):$(CAM)OBSIMAGE-ArrayData.TSEL 	 $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(PREFIX):$(CAM)FITS-Fit_RBV.TSEL 		 $(SYS)-$(DEV):Time-I.TIME")
afterInit("dbpf $(PREFIX):$(CAM)FITS-Y_RBV.TSEL 		 $(SYS)-$(DEV):Time-I.TIME")

