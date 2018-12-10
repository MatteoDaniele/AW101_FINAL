var (width,height)=(512,512);
var cameraName = "view-camera";
# view number
var display_view = func(view=0)
{
    var title = "canvas test: "~ cameraName;

    var window = canvas.Window.new([width,height],"dialog");
    window.set("title",title);

    var myCanvas = window.createCanvas();
    # myCanvas.set("background",canvas.style.getColor("bg_color"));

    # creating the top-level/root group
    # which will contain all other elements/group
    var root = myCanvas.createGroup();
    var child = root.createChild(view);

}

display_view(view: 0);