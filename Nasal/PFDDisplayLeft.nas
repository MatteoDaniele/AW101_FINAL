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
PFDInfoDisplayLeft.setColorBackground(0,0,0,1);
# place it on the glass base object
PFDInfoDisplayLeft.addPlacement({"node": "glass base left"});
# basic element of type group, which is the only element that can have
# other elements as children. So the first step is to create a new group:
var PFDDisplayGroup = PFDInfoDisplayLeft.createGroup();
# create text element and set values
var rotations = PFDDisplayGroup.createChild("text", "rotations");
# origin on top left corner
var fontSize = 80;
var fontAspectRatio = 1.2;
var interLine = 10;
# all values from osgText are supported (see $FG_ROOT/Docs/README.osgtext)
rotations.setAlignment("left-center")
# Fonts are loaded either from $AIRCRAFT_DIR/Fonts or $FG_ROOT/Fonts
         .setFont("LiberationFonts/LiberationSans-Regular.ttf")
# Set font size and optionally character aspect ratio
         .setFontSize(fontSize, fontAspectRatio)
# translation
         .setTranslation(0,160)
# Text color and color background
         .setColor(0,1,0,1);
#--------------------------------------------------------------------
# update the PFD info display left
phi = getprop("orientation/roll-deg");
theta = getprop("orientation/pitch-deg");
psi = getprop("orientation/yaw-deg");

rotations.setText("phi = "~ sprintf("%.2f",phi) ~"° \n"~
                  "theta ="~ sprintf("%.2f",theta) ~"° \n"~
                  "psi ="~ sprintf("%.2f",psi) ~"°")
         .enableUpdate();

# updates values displayed
var rotationsStatus = func()
{
    prop_phi = getprop("orientation/roll-deg");
    prop_theta = getprop("orientation/pitch-deg");
    prop_psi = getprop("orientation/yaw-deg");
    rotations.updateText("phi = "~ sprintf("%.2f",prop_phi) ~"° \n"~
                         "theta ="~ sprintf("%.2f",prop_theta) ~"° \n"~
                         "psi ="~ sprintf("%.2f",prop_psi) ~"°");
};

setlistener("orientation/roll-deg",func{rotationsStatus()});
setlistener("orientation/pitch-deg",func{rotationsStatus()});
setlistener("orientation/yaw-deg",func{rotationsStatus()});