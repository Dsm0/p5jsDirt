var messages = [new Thing({})];
var drawFunc = "box(200,200,200)";
var assets = { "images": {} };
let microphone, fft, level;

function setup() {


  createCanvas(windowWidth, windowHeight, WEBGL);
  textSize(40);
  rockSalt = loadFont("fonts/RockSalt.ttf");
  textFont(rockSalt, 48);

  console.log("click screen once to enable audio-in");

  getAudioContext().suspend();

  microphone = new p5.AudioIn();
  microphone.start();

  amplitude = new p5.Amplitude();
  level = amplitude.getLevel();

  fft = new p5.FFT();
  fft.setInput(microphone);

};

function saveShader(shaderName, shaderVert, shaderFrag) {
  shaderAttributes = createShader(shaderVert, shaderFrag)
  console.log("shader:" + shaderName + " saved to \"shaders\"");
  assets["shaders"][shaderName] = shader(shaderAttributes);
}

function saveImage(imageUrl, name) {
  img = createImg(imageUrl, "imgs/notFound.jpg", "anonymous");
  // console.log(img.crossOrigin);
  img.hide()
  console.log("IMG:");
  console.log(img);
  img.crossOrigin = "anonymous";
  assets["images"][name] = img;
}


function draw() {
  background(0);
  var message = messages[messages.length - 1];
  if(drawFunc === "") return;
  try {
    eval(drawFunc);
  } catch (err) {
    text("some sort of error");
    // eval(lastDrawFunc);
    console.log("drawFunc");
    console.log(drawFunc);
    console.log(err);
  }
  // for use with p5.hs draw functions that call tidal params
}

// SyntaxError: missing ) after argument list
//     at draw (superDirt.js:40)
//     at b.a.default.redraw (p5.min.js:3)
//     at _draw (p5.min.js:3)

function oscEvent(m) { // console.log("in osc event")

  var i;
  var paramDict = {};

  for (i = 0; i < m.args.length; ++i) {
    // console.log(m.args[i])
    var param = m.args[i];
    var paramValue = m.args[i + 1];
    paramDict[param] = paramValue;
    ++i; // it actually only looks at every other value, b/c there are 2 ++i's
  };

  switch (paramDict['draw']) {
    case "":
      drawFunc = "";
      // console.log("things: " + things);
      break;
    case undefined:
      break;
    default:
      drawFunc = paramDict['draw'];
  };

  switch (paramDict['setup']) {
    case "":
      break;
    case undefined:
      break;
    default:
      setupCall(paramDict['setup']);
  };

  switch (paramDict["shaderName"]) {
    case undefined:
      break;
    default:
      console.log("was in shaders");
      shaderName = paramDict["shaderName"]
      shaderVert = paramDict["shaderVert"]
      shaderFrag = paramDict["shaderFrag"]
      console.log("loading shader: " + shaderName)
      saveShader(shaderName, shaderVert, shaderFrag)
      console.log(assets)
  }

  switch (paramDict['imageURL']) {
    case undefined:
      break;
    default:
      console.log("was in images");
      // lastDrawFunc = "box(200,200,200)";
      imageURL = paramDict['imageURL'];
      imageName = paramDict['imageName'];
      saveImage(imageURL, imageName)
      console.log(assets)

  };

  if (paramDict['s'] != undefined) {
    messages.push(new Thing(paramDict));
  }
}

// function mousePressed() {
//   userStartAudio();
//   console.log("audio enabled");
// }

function setupCall(func) {
  eval(func);
  console.log("param change evaluated");
}
