importPackage(Packages.org.csstudio.opibuilder.scriptUtil);

var macroInput = DataUtil.createMacrosInput(true);
var prefix = PVUtil.getString(pvArray[0]);

macroInput.put("PREFIX", prefix);
widgetController.setPropertyValue("macros", macroInput);