var messages = [new Thing({})];
var drawFunc = "box(200,200,200)";
var assets = {"imageURLs" : {}, "images" : {}};
let microphone, fft;

function setup() {
  createCanvas(windowWidth, windowHeight,WEBGL);
  textSize(40);
  rockSalt = loadFont("fonts/RockSalt.ttf");
  textFont(rockSalt,48);
  microphone = new p5.AudioIn();
  microphone.start();
  // fft = new p5.FFT();
  // fft.setInput(microphone);
};

function preload(){
  imageURLs = assets["imageURLs"];
  Object.entries(assets["imageURLs"]).forEach(([key,value]) => {
    img = createImg(value);
    img.hide()
    console.log("IMG:");
    console.log(img);
    img.crossOrigin="anonymous";
    assets["images"][key] = img;
  })
};

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
    text("some sort of error");
    // eval(lastDrawFunc);
    console.log("drawFunc");
    console.log(drawFunc);
    console.log(err);
  }
  // print(message.get("orbit"))
  // for use with p5.hs draw functions that call tidal params
}

// SyntaxError: missing ) after argument list
//     at draw (superDirt.js:40)
//     at b.a.default.redraw (p5.min.js:3)
//     at _draw (p5.min.js:3)

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

  switch(paramDict['draw']) {
    case "":
    drawFunc = "";
    // console.log("things: " + things);
      break;
    case undefined:
      break;
    default:
      drawFunc = paramDict['draw'];
  };

  switch(paramDict['imageURL']) {
    case "":
    assets = "";
    // console.log("things: " + things);
      break;
    case undefined:
      break;
    default:
      // lastDrawFunc = "box(200,200,200)";
      imageName = paramDict['imageName'];
      assets["imageURLs"][imageName] = paramDict['imageURL'];
      console.log("was in images");
      preload()
  };

  if(paramDict['s'] != undefined) {
    // console.log("about to push thing")
    messages.push(new Thing(paramDict));
    // console.log("things: " + things);
  }
}
