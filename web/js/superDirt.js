var messages = [new Thing({})];
var drawFunc = "box(200,200,200)";
var lastDrawFunc = "box(200,200,200)";

function setup() {
  createCanvas(windowWidth, windowHeight,WEBGL);
  textSize(40);
  textFont('Georgia',48);
}

function olddraw() {
  background(0);
  for (i = messages.length - 1;
  // for (i = things.length - 1;
    i >= 0
    ; i--) {
    message = messages[i];
      if (message.alive()) {
        console.log("about to Draw:");
        message.draw();
      }
      else {
        message.remove(i);
      }
  }
}

// function parseFuncMessage(funcSlice){
// }


function draw(){
  background(0);
  var message = messages[messages.length - 1];
  try {
    eval(drawFunc);
  }catch(err) {
    eval(lastDrawFunc);
    console.log("drawFunc");
    console.log(drawFunc);
    console.log(err);
  }
  // print(message.get("orbit"))
  // for use with p5.hs draw functions that call tidal params
}

function oscEvent(m) {
  // console.log("in osc event")

  var i;
  var paramDict = {};

  for(i = 0; i < m.args.length; ++i) {
    // console.log(m.args[i])
    var param = m.args[i];
    var paramValue = m.args[i+1];
    paramDict[param] = paramValue;
    ++i; // it actually only looks at every other value, b/c there are 2 ++i's
  };

  switch(paramDict['func']) {
    case "":
    drawFunc = paramDict['func'];
    // console.log("things: " + things);
      break;
    case undefined:
      break;
    default:
      // lastDrawFunc = "box(200,200,200)";
      drawFunc = paramDict['func'];
  }
  if(paramDict['s'] != undefined) {
    // console.log("about to push thing")
    messages.push(new Thing(paramDict));
    // console.log("things: " + things);
  }
}
