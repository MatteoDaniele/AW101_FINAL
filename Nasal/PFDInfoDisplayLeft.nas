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
var leftDisplayText = PFDDisplayGroup.createChild("text", "optional ID for element");
# origin on top left corner
leftDisplayText.setTranslation(0,80);
 # all values from osgText are supported (see $FG_ROOT/Docs/README.osgtext)
leftDisplayText.setAlignment("left-center");
 # Fonts are loaded either from $AIRCRAFT_DIR/Fonts or $FG_ROOT/Fonts
leftDisplayText.setFont("LiberationFonts/LiberationSans-Regular.ttf");
# Set font size and optionally character aspect ratio
leftDisplayText.setFontSize(80, 1.2);
# Text color
leftDisplayText.setColor(0,1,0);
#--------------------------------------------------------------------
# update the PFD info display left

# Pitch angle - initialization
pitchAngle = getprop("orientation/pitch-deg");
leftDisplayText.setText("theta = "~ sprintf("%.2f",pitchAngle) ~"°").show();
# Pitch angle - main loop: updates values displayed
var pitchAngleStatus = func()
{
pitchAngle = getprop("orientation/pitch-deg");
leftDisplayText.setText("theta = "~ sprintf("%.2f",pitchAngle) ~"°").show();
}
setlistener("orientation/pitch-deg",func{pitchAngleStatus()});

#-------------------------------------------------------------------
# use the created text
#text.show();
# ...
#text.hide();
# ...
#text.setText("Hello!").show();