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
# hsi display -----------------------------------------------------
var hsiDisplay = canvas.new({
    "name": "hsiDisplay",
    "size": [1024,1024],
    "view": [64,32],
    "mipmapping": 1
});
var hsiFontSize = 32;
var hsiFontAspectRatio = 1.5;
hsiDisplay.addPlacement({"node":"glass heading display"});
hsiDisplay.setColorBackground(0,0,0);
var hsiDisplayGroup = hsiDisplay.createGroup();
var hsiInfos = hsiDisplayGroup.createChild("text","hsi");
hsiInfos.setAlignment("center-center")
        .setFont("LiberationFonts/LiberationSansNarrow-Bold.ttf")
        .setTranslation(32,16)
        .setFontSize(hsiFontSize)#,hsiFontAspectRatio)
        .setColor(0,1,0);
# hsi display -----------------------------------------------------
#------------------------------------------------------------------
#------------------------------------------------------------------
# airspeed display ------------------------------------------------
var airspeedDisplay = canvas.new(
{
    "name": "airspeedDisplay",
    "size": [1024,1024], # underlying texture size
    "view": [64,32], # virtual resolution of the Display
    "mipmapping": 1
});
var airspeedFontSize = 32;
var airspeedFontAspectRatio = 1.5;
airspeedDisplay.addPlacement({"node":"glass speed display"});
airspeedDisplay.setColorBackground(0,0,0);
var airspeedDisplayGroup = airspeedDisplay.createGroup();
var airspeedInfos = airspeedDisplayGroup.createChild("text","airspeed");
airspeedInfos.setAlignment("center-center")
             .setFont("LiberationFonts/LiberationSansNarrow-Bold.ttf")
             .setTranslation(32,16)
             .setFontSize(airspeedFontSize,airspeedFontAspectRatio)
             .setColor(0,1,0);

# airspeed display -----------------------------------------------
#-----------------------------------------------------------------
#------------------------------------------------------------------
# groundspeed display --------------------------------------------
var groundspeedDisplay = canvas.new(
{
    "name": "groundspeedDisplay",
    "size": [1024,1024],
    "view": [512,256],
    "mipmapping": 1
});

var groundspeedFontSize = 128;
var groundspeedFontAspectRatio = 1.5;
groundspeedDisplay.addPlacement({"node":"glass groundspeed display"});
groundspeedDisplay.setColorBackground(0,0,0);
var groundspeedDisplayGroup = groundspeedDisplay.createGroup();
var groundspeedInfosDigits = groundspeedDisplayGroup.createChild("text","groundspeed digits");
var groundspeedInfosIndics = groundspeedDisplayGroup.createChild("text","groundspeed indications");
groundspeedInfosDigits.setAlignment("center-center")
                      .setFont("LiberationFonts/LiberationSansNarrow-Bold.ttf")
                      .setTranslation(384,128)
                      .setFontSize(groundspeedFontSize,groundspeedFontAspectRatio)
                      .setColor(1,1,1);
groundspeedInfosIndics.setAlignment("center-center")
                      .setFont("LiberationFonts/LiberationSansNarrow-Bold.ttf")
                      .setTranslation(128,128)
                      .setFontSize(groundspeedFontSize,groundspeedFontAspectRatio)
                      .setColor(0,200/256,230/256,1);
# groundspeed display --------------------------------------------
#-----------------------------------------------------------------
#------------------------------------------------------------------
# altitude display hundreds-thousands ----------------------------
var altitude10kDisplay = canvas.new(
{
    "name": "altitude10kDisplay",
    "size":[1024,1024],
    "view":[64,32],
    "mipmapping": 1
});
var altitude10kFontSize = 32;
var altitude10kFontAspectRatio = 1.0;
altitude10kDisplay.addPlacement({"node":"glass altitude display 10k"});
altitude10kDisplay.setColorBackground(0,0,0);
var altitude10kDisplayGroup = altitude10kDisplay.createGroup();
var altitude10kInfos = altitude10kDisplayGroup.createChild("text","altitude10k");
altitude10kInfos.setAlignment("left-center")
                .setFont("LiberationFonts/LiberationSansNarrow-Bold.ttf")
                .setTranslation(16,16)
                .setFontSize(altitude10kFontSize,altitude10kFontAspectRatio)
                .setColor(0,1,0);
# altitude display hundreds-thousands ----------------------------
#-----------------------------------------------------------------
#------------------------------------------------------------------
# altitude display units-tenths ----------------------------------
var altitude100Display = canvas.new(
{
    "name": "altitude100Display",
    "size":[1024,1024],
    "view":[64,32],
    "mipmapping": 1
});
var altitude100FontSize = 16;
var altitude100FontAspectRatio = 0.5;
altitude100Display.addPlacement({"node":"glass altitude display 100"});
altitude100Display.setColorBackground(0,0,0);
var altitude100DisplayGroup = altitude100Display.createGroup();
var altitude100Infos = altitude100DisplayGroup.createChild("text","altitude");
altitude100Infos.setAlignment("right-center")
                .setFont("LiberationFonts/LiberationSansNarrow-Bold.ttf")
                .setTranslation(38,16)
                .setFontSize(altitude100FontSize,altitude100FontAspectRatio)
                .setColor(0,1,0);
# altitude display units-tenths ----------------------------------
#-----------------------------------------------------------------
#-----------------------------------------------------------------
# pressure display -----------------------------------------------
var pressureDisplay = canvas.new(
{
    "name": "pressureDisplay",
    "size": [1024,1024],
    "view": [64,32], # increase virtual size
    "mipmapping": 1
});

var pressureFontSize = 16;
var pressureFontAspectRatio = 1.5;
pressureDisplay.addPlacement({"node":"glass pressure display"});
pressureDisplay.setColorBackground(0,0,0);
var pressureDisplayGroup = pressureDisplay.createGroup();
var pressureInfosDigits = pressureDisplayGroup.createChild("text","pressure digits");
var pressureInfosUmeas  = pressureDisplayGroup.createChild("text","pressure units");
pressureInfosDigits.setAlignment("center-center")
                   .setFont("LiberationFonts/LiberationSansNarrow-Bold.ttf")
                   .setTranslation(16,16)
                   .setFontSize(pressureFontSize,pressureFontAspectRatio)
                   .setColor(1,1,1);
pressureInfosUmeas.setAlignment("center-center")
                  .setFont("LiberationFonts/LiberationSansNarrow-Bold.ttf")
                  .setTranslation(48,16)
                  .setFontSize(pressureFontSize,pressureFontAspectRatio)
                  .setColor(1,1,1);
# pressure display -----------------------------------------------
#------------------------------------------------------------------
#-----------------------------------------------------------------
# vertical speed display -----------------------------------------
var verspeedDisplay = canvas.new(
{
    "name": "verticalSpeedDisplay",
    "size": [1024,1024],
    "view": [64,32],
    "mipmapping": 1
});

var verspeedFontSize = 32;
var verspeedFontAspectRatio = 1.5;
verspeedDisplay.addPlacement({"node":"glass vertspeed display"});
verspeedDisplay.setColorBackground(0,0,0);
var verspeedDisplayGroup = verspeedDisplay.createGroup();
var verspeedInfos = verspeedDisplayGroup.createChild("text","verspeed digits");
verspeedInfos.setAlignment("center-center")
             .setFont("LiberationFonts/LiberationSansNarrow-Bold.ttf")
             .setFontSize(verspeedFontSize,verspeedFontAspectRatio)
             .setTranslation(32,16)
             .setColor(0,1,0);

var verspeedIndicator = canvas.new(
{
    "name": "verticalSpeedIndicator",
    "size": [1024,1024],
    "view": [64,32],
    "mipmappping": 1
});
# vertical speed display -----------------------------------------
#-----------------------------------------------------------------


# update informations --------------------------------------------


#-----------------------------------------------------------------
# hsi display ----------------------------------------------------
hsi = getprop("orientation/heading-magnetic-deg");
hsiInfos.setText(sprintf("%.0f°",hsi))
        .enableUpdate();

var hsiStatus = func()
{
    property = getprop("orientation/heading-magnetic-deg");
    hsiInfos.updateText(sprintf("%.0f°",property));
}
setlistener("orientation/heading-magnetic-deg",func{hsiStatus()});
# hsi display ----------------------------------------------------
#-----------------------------------------------------------------






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
    airspeedInfos.setColor(0,1,0);

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
        airspeedInfos.setColor(0,1,0);
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
gs = getprop("velocities/groundspeed-kt");
# TODO: anything else is displayed in this area of the display? groundspeed in knots, and something else?
var gsIndics = "GS";
#if(gsIndics == "GS")
#{
#    gs = getprop("velocities/groundspeed-kt");
#}
#else{
#}
groundspeedInfosIndics.setText(gsIndics)
                      .enableUpdate();

groundspeedInfosDigits.setText(sprintf("%.1f",gs))
                      .enableUpdate();
var groundspeedStatus = func()
{
    property = getprop("velocities/groundspeed-kt");
    groundspeedInfosDigits.updateText(sprintf("%.1f",property)).show();
}
setlistener("velocities/groundspeed-kt",func{groundspeedStatus()});
# groundspeed display ---------------------------------------------
#------------------------------------------------------------------
#------------------------------------------------------------------
# altitude display ------------------------------------------------
alt = getprop("position/altitude-ft");
if(alt > 0.0)
{
    altitude100Display.setColorBackground(0,0,0);
    altitude100Infos.setColor(0,1,0);

    altitude10kDisplay.setColorBackground(0,0,0);
    altitude10kInfos.setColor(0,1,0);
}
else
{
    altitude100Display.setColorBackground(1,0,0);
    altitude100Infos.setColor(1,1,1);

    altitude10kDisplay.setColorBackground(1,0,0);
    altitude10kInfos.setColor(1,1,1);
}

var altString = sprintf("%0.f",alt);
var altStringLength = size(altString);
var altStringTenthAbove = right(sprintf("%.0f",alt+1),2);
var altStringTenthBelow = right(sprintf("%.0f",alt-1),2);
var altStringTenth = right(sprintf("%.0f",alt),2);
var altConc = altStringTenthAbove ~ "\n" ~ altStringTenth ~ "\n" ~ altStringTenthBelow;

# only tenths shown in the right side of the display
altitude100Infos.setText(altConc)
                .enableUpdate();

# hundreds to ten thousands shown in the left side of the display
if(altStringLength > 2)
{
    altitude10kInfos.setText(left(altString,altStringLength-2));

}
else
{
    altitude10kInfos.setText("000");
}

altitude10kInfos.enableUpdate();

var altitudeStatus = func()
{
    property = getprop("position/altitude-ft");
    if(property > 0.0)
    {
        altitude100Display.setColorBackground(0,0,0);
        altitude100Infos.setColor(0,1,0);

        altitude10kDisplay.setColorBackground(0,0,0);
        altitude10kInfos.setColor(0,1,0);
    }
    else
    {
        altitude100Display.setColorBackground(1,0,0);
        altitude100Infos.setColor(1,1,1);

        altitude10kDisplay.setColorBackground(1,0,0);
        altitude10kInfos.setColor(1,1,1);
    }

    var propertyString = sprintf("%0.f",property);
    var propertyStringLength = size(propertyString);
    var propertyStatusStringAbove = right(sprintf("%.0f",property+1),2);
    var propertyStatusStringBelow = right(sprintf("%.0f",property-1),2);
    var propertyStatusString = right(sprintf("%.0f",property),2);
    var propertyStatusConc = propertyStatusStringAbove ~ "\n" ~ propertyStatusString ~ "\n" ~ propertyStatusStringBelow;

    # only first 2 decimal elements shown in the right side of the display
    altitude100Infos.updateText(propertyStatusConc);

    # other elements shown in the left side of the element
    if(propertyStringLength > 2)
    {
        altitude10kInfos.updateText(left(propertyString,propertyStringLength-2));
    }
    else
    {
        altitude10kInfos.updateText("000");
    }
}
setlistener("position/altitude-ft",func{altitudeStatus()});
# altitude display -----------------------------------------------
#-----------------------------------------------------------------
#-----------------------------------------------------------------
# pressure display -----------------------------------------------

pre = getprop("environment/pressure-inhg");

#TODO pressure type differentiation (inhg, hpa, QNH,QFE,ecc)
var preMeas = "inHg";
#if (preMeas="inHg")
#{
#    pre = getprop("environment/pressure-inhg");
#}

pressureInfosDigits.setText(sprintf("%.2f",pre))
                   .enableUpdate();

pressureInfosUmeas.setText(preMeas)
                  .enableUpdate();

var pressureStatus = func()
{
    property = getprop("environment/pressure-inhg");
    pressurInfosDigits.updateText(sprintf("%.2f",property)).show();
}
setlistener("environment/pressure-inhg",func{pressureStatus()});

# pressure display -----------------------------------------------
#-----------------------------------------------------------------
#-----------------------------------------------------------------
# vertical speed display -----------------------------------------

ver = getprop("velocities/vertical-speed-fps");
if(ver==nil)
{
    verspeedInfos.setText("000");
}
else
{
#TODO has to be modified in ft per minute
verspeedInfos.setText(sprintf("%.0f",ver));
}

verspeedInfos.enableUpdate();

var verStatus = func()
{
    property = getprop("velocities/vertical-speed-fps");
    verspeedInfos.updateText(sprintf("%.0f",property));
}
setlistener("velocities/vertical-speed-fps",func{verStatus()});
# vertical speed display -----------------------------------------
#-----------------------------------------------------------------
