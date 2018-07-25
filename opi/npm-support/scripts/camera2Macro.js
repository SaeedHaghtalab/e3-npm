importPackage(Packages.org.csstudio.opibuilder.scriptUtil);

var macroInput = DataUtil.createMacrosInput(true);
var prefix = PVUtil.getString(pvArray[0]);
var orient = PVUtil.getString(pvArray[1]);

macroInput.put("P", prefix);
macroInput.put("ORIENT", orient);
widgetController.setPropertyValue("macros", macroInput);