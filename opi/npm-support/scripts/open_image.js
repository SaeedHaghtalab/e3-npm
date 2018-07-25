importPackage(Packages.org.csstudio.opibuilder.scriptUtil);

var open_selector = "npm_open_selector"

var prefix = widget.getMacroValue("P")
var orient = widget.getMacroValue("ORIENT")


var image_macros = DataUtil.createMacrosInput(true)

image_macros.put("P", prefix)
image_macros.put("R", orient)

var openmode = display.getWidget(open_selector).getValue()
if (openmode == "New Window")
  openmode = 2
else
  openmode = 0

ScriptUtil.openOPI(widget, "npm-image.opi", openmode, image_macros)
