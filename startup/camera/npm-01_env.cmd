epicsEnvSet("SECSUB",   "LEBT-010") 

epicsEnvSet("HCAMIP",   "$(HCAMIP=192.6.95.95)")
epicsEnvSet("VCAMIP",   "$(VCAMIP=192.6.96.96)")

epicsEnvSet("SYS"       "FEB-030Row:PBI")
epicsEnvSet("DEV"       "EVR-009")
epicsEnvSet("EVRPCIID", "05:00.0")


afterInit("dbpf $(SYS)-$(DEV):DlyGen0-Width-SP 1")
afterInit("dbpf $(SYS)-$(DEV):DlyGen0-Evt-Trig0-SP 14")
afterInit("dbpf $(SYS)-$(DEV):OutFPUV02-Src-Pulse-SP 'Pulser 0'")

afterInit("dbpf $(SYS)-$(DEV):DlyGen1-Width-SP 1")
afterInit("dbpf $(SYS)-$(DEV):DlyGen1-Evt-Trig0-SP 14")
afterInit("dbpf $(SYS)-$(DEV):OutFPUV04-Src-Pulse-SP 'Pulser 1'")

afterInit("dbpf $(SYS)-$(DEV):DlyGen2-Width-SP 1")
afterInit("dbpf $(SYS)-$(DEV):DlyGen2-Evt-Trig0-SP 14")
afterInit("dbpf $(SYS)-$(DEV):OutFPUV06-Src-Pulse-SP 'Pulser 2'")

afterInit("dbpf $(SYS)-$(DEV):DlyGen3-Width-SP 1")
afterInit("dbpf $(SYS)-$(DEV):DlyGen3-Evt-Trig0-SP 14")
afterInit("dbpf $(SYS)-$(DEV):OutFPUV08-Src-Pulse-SP 'Pulser 3'")


