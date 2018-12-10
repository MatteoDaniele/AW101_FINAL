#--------------------------------------------------------------------
# Author: Matteo Daniele
# June 2018
# Attila Frame Simulator
# Politecnico di Milano
#--------------------------------------------------------------------






# PFD Info Display to the left of the HSI
var PFDInfoDisplayLeft = canvas.new(
{
    "name": "PFDInfoDisplayLeft", # name to identify the object
    "size": [1024,1024], # size of the underlying texture (pow of 2 required) [resolution]
    "view": [1024,1024], # virtual resolution (defines the coord system of the canvas
    # which will be stretched the size of the texture, required)
    "mipmapping": 1 # enable mipmapping: optional
});

# built on a black texture, but in beta testing better be safe
PFDInfoDisplayLeft.setColorBackground(0,0,0);
# place it on the glass base object
PFDInfoDisplayLeft.addPlacement({"node": "glass base left"});
# basic element of type group, which is the only element that can have
# other elements as children. So the first step is to create a new group:
var PFDDisplayGroup = PFDInfoDisplayLeft.createGroup();
# create text element and set values
var line_1 = PFDDisplayGroup.createChild("text", "Line 1");
var line_2 = PFDDisplayGroup.createChild("text", "Line 2");
var line_3 = PFDDisplayGroup.createChild("text", "Line 3");
# origin on top left corner
var fontSize = 80;
var fontAspectRatio = 1.2;
var interLine = 10;

# all values from osgText are supported (see $FG_ROOT/Docs/README.osgtext)
line_1.setAlignment("left-center");
line_2.setAlignment("left-center");
line_3.setAlignment("left-center");

# Fonts are loaded either from $AIRCRAFT_DIR/Fonts or $FG_ROOT/Fonts
line_1.setFont("LiberationFonts/LiberationSans-Regular.ttf");
line_2.setFont("LiberationFonts/LiberationSans-Regular.ttf");
line_3.setFont("LiberationFonts/LiberationSans-Regular.ttf");

# Set font size and optionally character aspect ratio
line_1.setFontSize(fontSize, fontAspectRatio);
line_2.setFontSize(fontSize, fontAspectRatio);
line_3.setFontSize(fontSize, fontAspectRatio);

# translation
line_1.setTranslation(0,80);
line_2.setTranslation(0,160);
line_3.setTranslation(0,240);


# Text color and color background
line_1.setColor(0,1,0);
line_2.setColor(0,1,0);
line_3.setColor(0,1,0);


#--------------------------------------------------------------------
# update the PFD info display left
phi = getprop("orientation/roll-deg");
theta = getprop("orientation/pitch-deg");
psi = getprop("orientation/yaw7-deg");

line_1.setText("phi = "~ sprintf("%.2f",phi) ~"°").show();
line_2.setText("theta ="~ sprintf("%.2f",theta) ~"°").show();
line_3.setText("psi ="~ sprintf("%.2f",psi) ~"°").show();
# updates values displayed
var phiStatus = func()
{
property = getprop("orientation/roll-deg");
line_1.setText("phi = "~ sprintf("%.2f",property) ~"°").show();
};
# updates values displayed
var thetaStatus = func()
{
property = getprop("orientation/pitch-deg");
line_2.setText("theta = "~ sprintf("%.2f",property) ~"°").show();
};
var psiStatus = func()
{
property = getprop("orientation/yaw-deg");
line_3.setText("psi = "~ sprintf("%.2f",property) ~"°").show();
};

setlistener("orientation/roll-deg",func{phiStatus()});
setlistener("orientation/pitch-deg",func{thetaStatus()});
setlistener("orientation/heading-deg",func{psiStatus()});


#-------------------------------------------------------------------
# use the created text
#text.show();
# ...
#text.hide();
# ...
#text.setText("Hello!").show();