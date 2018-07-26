epicsEnvSet("EVR_PCIDOMAIN"   "0")
epicsEnvSet("EVR_PCIBUS"      "0x5")
epicsEnvSet("EVR_PCIDEVICE"   "0x0")
epicsEnvSet("EVR_PCIFUNCTION" "0")

mrmEvrSetupPCI($(DEVICE), $(EVR_PCIDOMAIN), $(EVR_PCIBUS), $(EVR_PCIDEVICE), $(EVR_PCIFUNCTION))
# Enable daisy chaining the optics cable between multiple EVRs
mrmEvrLoopback($(EVR), 1, 0)

dbLoadRecords("evr-pcie-300.db", "SYS=$(SYS), DEVICE=$(DEVICE), Link-Clk-SP=88.0525, FrontUnivOut2-Src-SP=0, Pul0-Width-SP=100, FrontUnivOut3-Src-SP=1, Pul1-Width-SP=100")

#one line for every event that want to receive. Code = Event
dbLoadRecords("evr-softEvent.template", "SYS=$(SYS), DEVICE=$(DEVICE), EVT=14, CODE=$(PULSE_EVT)")
dbLoadRecords("evr-softEvent.template", "SYS=$(SYS), DEVICE=$(DEVICE), EVT=122, CODE=$(HB_EVT)")
                                                     
#Assign event 14 to a Pulser 0 and 1.
dbLoadRecords("evr-pulserMap.template", "SYS=$(SYS), DEVICE=$(DEVICE), PID=0, F=Trig, ID=0, EVT=$(PULSE_EVT)")
dbLoadRecords("evr-pulserMap.template", "SYS=$(SYS), DEVICE=$(DEVICE), PID=1, F=Trig, ID=0, EVT=$(PULSE_EVT)")

