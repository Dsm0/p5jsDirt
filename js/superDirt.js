var things = [];

Array.prototype.remove = function() {
    var what, a = arguments, L = a.length, ax;
    while (L && this.length) {
        what = a[--L];
        while ((ax = this.indexOf(what)) !== -1) {
            this.splice(ax, 1);
        }
    }
    return this;
};
// ^^ a good to have

function setup() {
  createCanvas(windowWidth, windowHeight);

  textSize(40);
  textFont('Georgia',48);
}

function draw() {
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

function oscEvent(m) {
  // console.log("in osc event")

  var i;
  var paramDict = {};

  for(i = 0; i < m.args.length; ++i) {
    var param = m.args[i];
    var paramValue = m.args[i+1];
    paramDict[param] = paramValue;
    ++i; // it actually only looks at every other value, b/c there are 2 ++i's
  };
  // things.push("1")
  // console.log("params Parsed");
  console.log(paramDict['s']);

  if (paramDict['s'] != undefined) {
    // console.log("about to push thing")
    things.push(new Thing(paramDict));
    // console.log("things: " + things);
  }
}
