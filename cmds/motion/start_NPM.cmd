##############################################################################
############# LEBT Motion Control crate 
#

# second version: Control of 4 actuators(LEBT NPM)
#
# ecmc version update to v5.3.0
#
#  Date: 2019-01-30
#
##############################################################################


# First version: Control of 4 actuators(LEBT NPM)
#
# e3 has been tested over Debian GNU/Linux 9.4
#
# Configuration details:
# - Close loop stepper (EL7037)
# - 2 Limit switches
# - Scaled as a linear system 
# - Homing sequemce 1: One of the limit switches as reference position
#
#
#  Date: 2018-05-17
#
##############################################################################

############################################################
############# Init


epicsEnvSet("TOP",          "$(E3_CMD_TOP)/../..")
epicsEnvSet("General_TOP",  "$(TOP)/startup/motion/general")
epicsEnvSet("HW_TOP",       "$(TOP)/startup/motion/hardware")
epicsEnvSet("Motion_TOP",   "$(TOP)/startup/motion/motion")
epicsEnvSet("ST_TOP",       "$(TOP)/startup/motion/")
epicsEnvSet("DB_TOP",       "$(TOP)/db")

< $(General_TOP)/require_E3
< $(General_TOP)/init


############################################################
############# ASYN Configuration:

epicsEnvSet("ECMC_MOTOR_PORT",    "$(SM_MOTOR_PORT=MCU1)")
epicsEnvSet("ECMC_ASYN_PORT",     "$(SM_ASYN_PORT=MC_CPU1)")
epicsEnvSet("ECMC_PREFIX",        "$(SM_PREFIX=LEBT-010:)")

ecmcAsynPortDriverConfigure($(ECMC_ASYN_PORT),1000,0,0)

asynOctetSetOutputEos(${ECMC_ASYN_PORT}, -1, ";\n")
asynOctetSetInputEos(${ECMC_ASYN_PORT}, -1, ";\n")

asynSetTraceMask(${ECMC_ASYN_PORT}, -1, 0x41)

asynSetTraceIOMask(${ECMC_ASYN_PORT}, -1, 6)
asynSetTraceInfoMask(${ECMC_ASYN_PORT}, -1, 15)

EthercatMCCreateController(${ECMC_MOTOR_PORT}, ${ECMC_ASYN_PORT}, "32", "200", "1000", "")

############################################################
############# Misc settings:
# Disable function call trace printouts
ecmcConfigOrDie "Cfg.SetEnableFuncCallDiag(0)"

# Disable on change printouts from objects (enable for easy logging)
ecmcConfigOrDie "Cfg.SetTraceMaskBit(15,0)"

# Choose to generate EPICS-records for EtherCAT-entries 
# (For records use ECMC_GEN_EC_RECORDS="-records" otherwise ECMC_GEN_EC_RECORDS="") 
epicsEnvSet("ECMC_GEN_EC_RECORDS",          "-records")

# Choose to generate EPICS-records for ax-entries (PosAct, SetPos,..)
# (For records use ECMC_GEN_AX_RECORDS="-records" otherwise ECMC_GEN_AX_RECORDS="") 
epicsEnvSet("ECMC_GEN_AX_RECORDS",          "-records")

# Update records in 100Hz (skip 9 cycles, based on 1000Hz sample rate)
epicsEnvSet("ECMC_ASYN_SKIP_CYCLES",       "9")

############################################################
############# Configure hardware:

< $(HW_TOP)/ecmcLEBT_NPM

##############################################################################
############# Write outputs in order to power switches (see elec. drawings):

ecmcConfigOrDie "Cfg.WriteEcEntryIDString(${ECMC_EC_SLAVE_NUM_DIG_OUT},OUPIN_1,1)"
ecmcConfigOrDie "Cfg.WriteEcEntryIDString(${ECMC_EC_SLAVE_NUM_DIG_OUT},OUPIN_2,1)"
#ecmcConfigOrDie "Cfg.WriteEcEntryIDString(${ECMC_EC_SLAVE_NUM_DIG_OUT},OUPIN_3,1)"
#ecmcConfigOrDie "Cfg.WriteEcEntryIDString(${ECMC_EC_SLAVE_NUM_DIG_OUT},OUPIN_4,1)"
ecmcConfigOrDie "Cfg.WriteEcEntryIDString(${ECMC_EC_SLAVE_NUM_DIG_OUT},OUPIN_5,1)"
ecmcConfigOrDie "Cfg.WriteEcEntryIDString(${ECMC_EC_SLAVE_NUM_DIG_OUT},OUPIN_6,1)"
#ecmcConfigOrDie "Cfg.WriteEcEntryIDString(${ECMC_EC_SLAVE_NUM_DIG_OUT},OUPIN_7,1)"
#ecmcConfigOrDie "Cfg.WriteEcEntryIDString(${ECMC_EC_SLAVE_NUM_DIG_OUT},OUPIN_8,1)"
ecmcConfigOrDie "Cfg.WriteEcEntryIDString(${ECMC_EC_SLAVE_NUM_DIG_OUT},OUPIN_9,1)"
ecmcConfigOrDie "Cfg.WriteEcEntryIDString(${ECMC_EC_SLAVE_NUM_DIG_OUT},OUPIN_10,1)"
#ecmcConfigOrDie "Cfg.WriteEcEntryIDString(${ECMC_EC_SLAVE_NUM_DIG_OUT},OUPIN_11,1)"
#ecmcConfigOrDie "Cfg.WriteEcEntryIDString(${ECMC_EC_SLAVE_NUM_DIG_OUT},OUPIN_12,1)"
ecmcConfigOrDie "Cfg.WriteEcEntryIDString(${ECMC_EC_SLAVE_NUM_DIG_OUT},OUPIN_13,1)"
ecmcConfigOrDie "Cfg.WriteEcEntryIDString(${ECMC_EC_SLAVE_NUM_DIG_OUT},OUPIN_14,1)"
#ecmcConfigOrDie "Cfg.WriteEcEntryIDString(${ECMC_EC_SLAVE_NUM_DIG_OUT},OUPIN_15,1)"
#ecmcConfigOrDie "Cfg.WriteEcEntryIDString(${ECMC_EC_SLAVE_NUM_DIG_OUT},OUPIN_16,1)"


##############################################################################
############# Configuration of doppler:

epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/startup/motion/protocol")

# Custom settings for LEBT NPM1 vertical camera actuator

#< $(ST_TOP)/NPMA_001_openloop
< $(ST_TOP)/NPMA_001

# Apply configurations to ECMC
< $(Motion_TOP)/ecmc_axis$(ECMC_GEN_AX_RECORDS)

# Custom settings for LEBT NPM1 horizontal camera actuator

< $(ST_TOP)/NPMA_002

# Apply configurations to ECMC
< $(Motion_TOP)/ecmc_axis$(ECMC_GEN_AX_RECORDS)

# Custom settings for LEBT NPM2 vertical camera actuator


epicsEnvSet("ECMC_PREFIX",        "LEBT-020:")

< $(ST_TOP)/NPMA_003

# Apply configurations to ECMC
< $(Motion_TOP)/ecmc_axis$(ECMC_GEN_AX_RECORDS)

# Custom settings for LEBT NPM1 horizontal camera actuator

< $(ST_TOP)/NPMA_004

# Apply configurations to ECMC
< $(Motion_TOP)/ecmc_axis$(ECMC_GEN_AX_RECORDS)

##############################################################################
############# Configure diagnostics:

ecmcConfigOrDie "Cfg.EcSetDiagnostics(1)"
ecmcConfigOrDie "Cfg.EcEnablePrintouts(0)"
ecmcConfigOrDie "Cfg.EcSetDomainFailedCyclesLimit(100)"
ecmcConfigOrDie "Cfg.SetDiagAxisIndex(1)"
ecmcConfigOrDie "Cfg.SetDiagAxisFreq(2)"
ecmcConfigOrDie "Cfg.SetDiagAxisEnable(0)"


##############################################################################
############# Load general controller level records:

< $(General_TOP)/general

#< $(DB_TOP)/dbLoadRecords("npmMotAlias.template")
#< $(DB_TOP)/dbLoadTemplate("npmMotAlias.template")
dbLoadRecords("$(DB_TOP)/npmMotAlias.template")


##############################################################################
############# Go to runtime:

ecmcConfigOrDie "Cfg.SetAppMode(1)"

