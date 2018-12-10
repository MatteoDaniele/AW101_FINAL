# create new window
var width = 512;
var height = 256;

var window = canvas.Window.new([width,height],"dialog");

# add canvas to new window and set up color/transparency
var myCanvas = window.createCanvas()
                     # color background
                     #.set("background",canvas.style.getColor("bg_color"));
                     # color defined by user
                     .set("background","#ffffff00");

var root = myCanvas.createGroup();

var graph = root.createChild("group");

var x_axis = graph.createChild("path","x-axis")
                  .moveTo(10,height/2)
                  .lineTo(width-10,height/2)
                  .setColor(0,0,0)
                  .setStrokeLineWidth(3);

var y_axis = graph.createChild("path","y-axis")
                 .moveTo(10,10)
                 .lineTo(10,height-10)
                 .setColor(0,0,0)
                 .setStrokeLineWidth(3);

var points = [];
var track = graph.createChild("path","track")
                 .moveTo(10,height/2)
                 .setColor(0,1,0)
                 .setStrokeLineWidth(4);

var updateGraph = func(property)
{
    var oldpoints = points;
    var time = getprop("sim/time/elapsed-sec");
    var points = [time,property];
    var vectorArray = [oldpoints,
                       points];
    track.cubicTo(vectorArray);

    x_axis.moveTo(time-1,height/2);
    y_axis.moveTo(time-1,height-10);

}

setlistener("sim/time/elapsed-sec",func{updateGraph(getprop("orientation/pitch-deg"))});

