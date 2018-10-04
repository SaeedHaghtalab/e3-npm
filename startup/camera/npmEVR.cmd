require mrfioc2, 2.2.0-rc2

epicsEnvSet("SYS"             "FEB-030Row:PBI")
epicsEnvSet("DEV"             "EVR-009")
epicsEnvSet("ESSEvtClockRate" "88.0525")

mrmEvrSetupPCI($(DEV), "05:00.0")
# Enable daisy chaining the optics cable between multiple EVRs
#mrmEvrLoopback($(EVR), 1, 0)

dbLoadRecords("evr-pcie-300dc-ess.db", "EVR=$(DEV), SYS=$(SYS), D=$(DEV), FEVT=$(ESSEvtClockRate)")
var evrMrmTimeNSOverflowThreshold 100000


