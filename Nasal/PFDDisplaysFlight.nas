#------------------------------------------------------------------
# Author: Matteo Daniele
# June 2018
# Attila Frame Simulator
# Politecnico di Milano
#------------------------------------------------------------------
# PFD Displays needed for flight
# - airspeed display
# - groundspeed display
# - altitude display
# - pressure display
# - vertical speed display
# - hsi display

#------------------------------------------------------------------
# airspeed display ------------------------------------------------
var airspeedDisplay = canvas.new(
{
    "name": "airspeedDisplay",
    "size": [64,32], # underlying texture size
    "view": [48,16], # virtual resolution of the Display
    "mipmapping": 1
});
var airspeedFontSize = 16;
#var airspeedFontAspectRatio = 1.2;
airspeedDisplay.addPlacement({"node":"airspeed_screen"});
airspeedDisplay.setColorBackground(0,0,0);
var airspeedDisplayGroup = airspeedDisplay.createGroup();
var airspeedInfos = airspeedDisplayGroup.createChild("text","airspeed");
airspeedInfos.setAlignment("center-center")
             .setFont("LiberationFonts/LiberationSansNarrow-Bold.ttf")
             .setTranslation(24,8)
             .setFontSize(airspeedFontSize)
             .setColor(1,1,1);

# airspeed display -----------------------------------------------
#-----------------------------------------------------------------
#------------------------------------------------------------------
#------------------------------------------------------------------
# altitude display ----------------------------------
var altitudeDisplay = canvas.new(
{
    "name": "altitudeDisplay",
    "size":[64,32],
    "view":[48,16],
    "mipmapping": 1
});
var altitudeFontSize = 16;
#var altitudeFontAspectRatio = 1.2;
altitudeDisplay.addPlacement({"node":"altitude_screen"});
altitudeDisplay.setColorBackground(0,0,0);
var altitudeDisplayGroup = altitudeDisplay.createGroup();
var altitudeInfos = altitudeDisplayGroup.createChild("text","altitude");
altitudeInfos.setAlignment("center-center")
                .setFont("LiberationFonts/LiberationSansNarrow-Bold.ttf")
                .setTranslation(24,8)
                .setFontSize(altitudeFontSize)
                .setColor(1,1,1);
# altitude display ----------------------------------
#-----------------------------------------------------------------
#-----------------------------------------------------------------
# pressure display -----------------------------------------------
#var pressureDisplay = canvas.new(
#{
#    "name": "pressureDisplay",
#    "size": [1024,1024],
#    "view": [64,32], # increase virtual size
#    "mipmapping": 1
#});
#
#var pressureFontSize = 16;
#var pressureFontAspectRatio = 1.5;
#pressureDisplay.addPlacement({"node":"glass pressure display"});
#pressureDisplay.setColorBackground(0,0,0);
#var pressureDisplayGroup = pressureDisplay.createGroup();
#var pressureInfosDigits = pressureDisplayGroup.createChild("text","pressure digits");
#var pressureInfosUmeas  = pressureDisplayGroup.createChild("text","pressure units");
#pressureInfosDigits.setAlignment("center-center")
#                   .setFont("LiberationFonts/LiberationSansNarrow-Bold.ttf")
#                   .setTranslation(16,16)
#                   .setFontSize(pressureFontSize,pressureFontAspectRatio)
#                   .setColor(1,1,1);
#pressureInfosUmeas.setAlignment("center-center")
#                  .setFont("LiberationFonts/LiberationSansNarrow-Bold.ttf")
#                  .setTranslation(48,16)
#                  .setFontSize(pressureFontSize,pressureFontAspectRatio)
#                  .setColor(1,1,1);
# pressure display -----------------------------------------------
#------------------------------------------------------------------
#-----------------------------------------------------------------
# vertical speed display -----------------------------------------
#var verspeedDisplay = canvas.new(
#{
#    "name": "verticalSpeedDisplay",
#    "size": [1024,1024],
#    "view": [64,32],
#    "mipmapping": 1
#});
#
#var verspeedFontSize = 32;
#var verspeedFontAspectRatio = 1.5;
#verspeedDisplay.addPlacement({"node":"glass vertspeed display"});
#verspeedDisplay.setColorBackground(0,0,0);
#var verspeedDisplayGroup = verspeedDisplay.createGroup();
#var verspeedInfos = verspeedDisplayGroup.createChild("text","verspeed digits");
#verspeedInfos.setAlignment("center-center")
#             .setFont("LiberationFonts/LiberationSansNarrow-Bold.ttf")
#             .setFontSize(verspeedFontSize,verspeedFontAspectRatio)
#             .setTranslation(32,16)
#             .setColor(0,1,0);

#var verspeedIndicator = canvas.new(
#{
#    "name": "verticalSpeedIndicator",
#    "size": [1024,1024],
#    "view": [64,32],
#    "mipmappping": 1
#});
# vertical speed display -----------------------------------------
#-----------------------------------------------------------------


# update informations --------------------------------------------



#-----------------------------------------------------------------
# airspeed display -----------------------------------------------
ias = getprop("velocities/airspeed-kt");
if(abs(ias) <= 10.0)
{
    airspeedDisplay.setColorBackground(230/256,185/256,0);
    airspeedInfos.setColor(0,0,0);
}
else if(ias > 10.0)
{
    airspeedDisplay.setColorBackground(0,0,0);
    airspeedInfos.setColor(1,1,1);

}
else
{
    airspeedDisplay.setColorBackground(1,0,0);
    airspeedInfos.setColor(1,1,1);

}
airspeedInfos.setText(sprintf("%.0f",ias))
             .enableUpdate();


var speedStatus = func()
{
    property = getprop("velocities/airspeed-kt");
    if(abs(property) <= 10.0)
    {
        airspeedDisplay.setColorBackground(230/256,185/256,0);
        airspeedInfos.setColor(0,0,0);
    }
    else if(property > 10.0)
    {
        airspeedDisplay.setColorBackground(0,0,0);
        airspeedInfos.setColor(1,1,1);
    }
    else
    {
        airspeedDisplay.setColorBackground(1,0,0);
        airspeedInfos.setColor(1,1,1);

    }
    airspeedInfos.updateText(sprintf("%.0f",property)).show();
}
setlistener("velocities/airspeed-kt",func{speedStatus()});
# airspeed display ------------------------------------------------
#------------------------------------------------------------------
#------------------------------------------------------------------
# groundspeed display ---------------------------------------------
#gs = getprop("velocities/groundspeed-kt");
#var gsIndics = "GS";
#if(gsIndics == "GS")
#{
#    gs = getprop("velocities/groundspeed-kt");
#}
#else{
#}
#groundspeedInfosIndics.setText(gsIndics)
#                      .enableUpdate();

#groundspeedInfosDigits.setText(sprintf("%.1f",gs))
#                      .enableUpdate();
#var groundspeedStatus = func()
#{
#    property = getprop("velocities/groundspeed-kt");
#    groundspeedInfosDigits.updateText(sprintf("%.1f",property)).show();
#}
#setlistener("velocities/groundspeed-kt",func{groundspeedStatus()});
# groundspeed display ---------------------------------------------
#------------------------------------------------------------------
#------------------------------------------------------------------
# altitude display ------------------------------------------------
alt = getprop("position/altitude-ft");
if(alt > 0.0)
{
    altitudeDisplay.setColorBackground(0,0,0);
    altitudeInfos.setColor(1,1,1);

}
else
{
    altitudeDisplay.setColorBackground(1,0,0);
    altitudeInfos.setColor(1,1,1);
}
altitudeInfos.setText(sprintf("%.0f",alt)).show()
             .enableUpdate();

var altitudeStatus = func()
{
    property = getprop("position/altitude-ft");
    if(property > 0.0)
    {
        altitudeDisplay.setColorBackground(0,0,0);
        altitudeInfos.setColor(1,1,1);

    }
    else
    {
        altitudeDisplay.setColorBackground(1,0,0);
        altitudeInfos.setColor(1,1,1);

    }
    altitudeInfos.updateText(sprintf("%.0f",property)).show();
}
setlistener("position/altitude-ft",func{altitudeStatus()});
# altitude display -----------------------------------------------
#-----------------------------------------------------------------
#-----------------------------------------------------------------
# vertical speed display -----------------------------------------

#ver = getprop("velocities/vertical-speed-fps");
#if(ver==nil)
#{
#    verspeedInfos.setText("000");
#}
#else
#{
#TODO has to be modified in ft per minute
#verspeedInfos.setText(sprintf("%.0f",ver));
#}

#verspeedInfos.enableUpdate();

#var verStatus = func()
#{
#    property = getprop("velocities/vertical-speed-fps");
#    verspeedInfos.updateText(sprintf("%.0f",property));
#}
#setlistener("velocities/vertical-speed-fps",func{verStatus()});
# vertical speed display -----------------------------------------
#-----------------------------------------------------------------
