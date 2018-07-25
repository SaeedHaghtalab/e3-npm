importPackage(Packages.org.csstudio.opibuilder.scriptUtil);

min = PVUtil.getDouble(pvs[0]);
max = PVUtil.getDouble(pvs[1]);
scaleMode = PVUtil.getLong(pvs[2]);
scaleMini = PVUtil.getDouble(pvs[3]);
scaleMaxi = PVUtil.getDouble(pvs[4]);

if (!isNaN(min) && !isNaN(max) && (scaleMode == 0)) { /*Auto mode*/
	widget.setPropertyValue("minimum", min);
	widget.setPropertyValue("maximum", max);
}
else if (!isNaN(scaleMini) && !isNaN(scaleMaxi) && (scaleMode == 1)) { /*Manual mode*/
	widget.setPropertyValue("minimum", scaleMini);
	widget.setPropertyValue("maximum", scaleMaxi);
}

