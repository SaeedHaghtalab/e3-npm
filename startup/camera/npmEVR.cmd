require mrfioc2, 2.2.0-rc5

epicsEnvSet("SYS"             "FEB-030Row:PBI")
epicsEnvSet("DEV"             "EVR-009")    # npm-ipc-01
#epicsEnvSet("DEV"             "EVR-013")   # npm-ipc-02
epicsEnvSet("ESSEvtClockRate" "88.0525")

mrmEvrSetupPCI($(DEV), "02:00.0")
# Enable daisy chaining the optics cable between multiple EVRs
#mrmEvrLoopback($(EVR), 1, 0)

dbLoadRecords("evr-pcie-300dc-ess.db", "EVR=$(DEV), SYS=$(SYS), D=$(DEV), FEVT=$(ESSEvtClockRate)")
var evrMrmTimeNSOverflowThreshold 100000


afterInit("dbpf $(SYS)-$(DEV):Time-I.EVNT 14")
afterInit("dbpf $(SYS)-$(DEV):Time-I.INP '@OBJ=$(DEV), Code=14'")
afterInit("dbpf $(SYS)-$(DEV):DC-Tgt-SP 70")
afterInit("dbpf $(SYS)-$(DEV):DlyGen0-Width-SP 1")
afterInit("dbpf $(SYS)-$(DEV):DlyGen0-Evt-Trig0-SP 14")
afterInit("dbpf $(SYS)-$(DEV):OutFPUV02-Src-Pulse-SP 'Pulser 0'")
afterInit("dbpf $(SYS)-$(DEV):OutFPUV04-Src-Pulse-SP 'Pulser 0'")
#doAfterIocInit
