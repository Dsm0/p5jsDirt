var things = [];
var drawFunc = "box(200,200,200)";

function setup() {
  createCanvas(windowWidth, windowHeight,WEBGL);
  textSize(40);
  textFont('Georgia',48);
}

function olddraw() {
  background(0);
  for (i = things.length - 1;
  // for (i = things.length - 1;
    i >= 0
    ; i--) {
    thing = things[i];
      if (thing.alive()) {
        console.log("about to Draw:");
        thing.draw();
      }
      else {
        things.remove(i);
      }
  }
}

function draw(){
  background(0);
  eval(drawFunc);
}

function oscEvent(m) {
  // console.log("in osc event")

  var i;
  var paramDict = {};

  for(i = 0; i < m.args.length; ++i) {
    console.log(m.args[i])
    var param = m.args[i];
    var paramValue = m.args[i+1];
    paramDict[param] = paramValue;
    ++i; // it actually only looks at every other value, b/c there are 2 ++i's
  };
  // things.push("1")
  // console.log("params Parsed");
  // console.log(paramDict['s']);

  if (paramDict['func'] != undefined) {
    // console.log("about to push func");
    // things.push(new Thing(paramDict));
    console.log("func:");
    console.log(paramDict['func']);
    drawFunc = paramDict['func'];
    // console.log("things: " + things);
  } else if(paramDict['s'] != undefined) {
    // console.log("about to push thing")
    things.push(new Thing(paramDict));
    // console.log("things: " + things);
  }
}
