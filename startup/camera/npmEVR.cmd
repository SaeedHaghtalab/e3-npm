require mrfioc2, 2.2.0-rc5


iocshLoad("$(mrfioc2_DIR)/evr-pcie-300dc.iocsh", "S=$(SYS), DEV=$(DEV), PCIID=$(EVRPCIID)")

afterInit("dbpf $(SYS)-$(DEV):Time-I.EVNT 14")
afterInit("dbpf $(SYS)-$(DEV):Time-I.INP '@OBJ=$(DEV), Code=14'")
afterInit("dbpf $(SYS)-$(DEV):DC-Tgt-SP 70")

