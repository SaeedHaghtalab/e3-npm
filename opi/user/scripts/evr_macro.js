importPackage(Packages.org.csstudio.opibuilder.scriptUtil);

var macroInput = DataUtil.createMacrosInput(true);
var prefix = PVUtil.getString(pvArray[0]);

macroInput.put("Device2Macro", prefix+"-EVR");

widgetController.setPropertyValue("macros", macroInput);