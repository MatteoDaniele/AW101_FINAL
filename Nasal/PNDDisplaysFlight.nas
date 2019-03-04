#------------------------------------------------------------------
# Author: Matteo Daniele
# March 2019
# Attila Frame Simulator
# Politecnico di Milano
#------------------------------------------------------------------
# PND display
# - heading display
# - groundspeed display
#------------------------------------------------------------------

#------------------------------------------------------------------
# heading display -------------------------------------------------
var headingDisplay = canvas.new(
{
    "name": "headingDisplay",
    "size": [64,32], # underlying texture size
    "view": [48,16], # virtual resolution of the Display
    "mipmapping": 1
});
var headingFontSize = 16;
headingDisplay.addPlacement({"node":"hdg_indicator_Pilot"});
headingDisplay.setColorBackground(0,0,0);
var headingDisplayGroup = headingDisplay.createGroup();
var headingInfos = headingDisplayGroup.createChild("text","heading");
headingInfos.setAlignment("center-center")
             .setFont("LiberationFonts/LiberationSansNarrow-Bold.ttf")
             .setTranslation(24,8)
             .setFontSize(headingFontSize)
             .setColor(1,1,1);

#------------------------------------------------------------------
# groundspeed display -------------------------------------------------
var groundspeedDisplay = canvas.new(
{
    "name": "groundspeedDisplay",
    "size": [64,32], # underlying texture size
    "view": [48,16], # virtual resolution of the Display
    "mipmapping": 1
});
var groundspeedFontSize = 14;
groundspeedDisplay.addPlacement({"node":"gndspeed_Pilot"});
groundspeedDisplay.setColorBackground(0,0,0);
var groundspeedDisplayGroup = groundspeedDisplay.createGroup();
var groundspeedInfos = groundspeedDisplayGroup.createChild("text","groundspeed");
groundspeedInfos.setAlignment("center-center")
             .setFont("LiberationFonts/LiberationSansNarrow-Bold.ttf")
             .setTranslation(24,8)
             .setFontSize(groundspeedFontSize)
             .setColor(1,1,1);

# update informations --------------------------------------------

# heading display -------------------------------------------------
hdg = getprop("orientation/heading-deg");
headingInfos.setText(sprintf("%.0f",hdg))
            .enableUpdate();
var headingStatus = func()
{
    property = getprop("orientation/heading-deg");
    headingInfos.updateText(sprintf("%.0f",property)).show();
}
setlistener("orientation/heading-deg",func{headingStatus()});

# groundspeed display -------------------------------------------------
gsp = getprop("velocities/groundspeed-kt");
groundspeedInfos.setText(sprintf("%.0f KTS",gsp))
                .enableUpdate();
var groundspeedStatus = func()
{
    property = getprop("velocities/groundspeed-kt");
    groundspeedInfos.updateText(sprintf("%.0f  KTS",property)).show();
}
setlistener("velocities/groundspeed-kt",func{groundspeedStatus()});