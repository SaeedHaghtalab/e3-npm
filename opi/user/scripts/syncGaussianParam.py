from org.csstudio.opibuilder.scriptUtil import PVUtil
from org.csstudio.opibuilder.scriptUtil import WidgetUtil
from org.csstudio.opibuilder.scriptUtil import DataUtil
from org.csstudio.opibuilder.scriptUtil import ConsoleUtil
		
pv_rbv_name = widget.getPropertyValue("pv_name")+"_RBV"
pv_rbv = PVUtil.createPV(pv_rbv_name, widget)

while(True):
	if(pv_rbv.isConnected()):
		pv_rbv_val = PVUtil.getDouble(pv_rbv)
		pv_setter = widget.getPV()
		pv_setter.setValue(pv_rbv_val)
		break
