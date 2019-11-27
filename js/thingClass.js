function getDefaultParams(){
  dict = {
  "sample" : null,
  "x": 1,
  "y" : 1,
  "dispTextSize" : 1,
  "hpf" : 0,
  "lpf" : 10000,
  "rotate" : 0,
  "orbit" : 0,
  "font" : "Georgia"
  }
  return(dict)
}

class Thing {
  constructor(paramDict){
    // console.log("in thing constructor")

    this.startTime = millis();
    this.life = 550;
    this.defaultParams = getDefaultParams();
    // the default params are for just in case
    // in mose cases, they'll be overwritten
    this.paramDict = paramDict;

    console.log(this.paramDict);
  };

  get(param) {
        try {
          if(param in this.paramDict){
          return(this.paramDict[param])
            }else{
          return(this.defaultParams[param])

        };
        }
        catch(err) {
          console.log("ERROR:: a parameter: " + param + " that does not exist was requested");
          console.log("official message:")
          console.log(err.message);
        }

  }

  alive () {
    return((this.startTime+this.life) >= millis());
  }

  draw () {
    var age = millis() - this.startTime;
    var progress = age/this.life;
    var fontLocal;

    if (progress < 1) {

      fill(255,255,255,int((1.0-progress)*255.0));

//
//      TEXT
//

      textAlign(CENTER);
      textFont(this.get("font"),48);
      rotate(this.get("rotate"));
      textSize(10 + this.get("dispTextSize"));
      text(this.get("s"),width/2 + this.get("x"), height/2 + this.get("y"));

    }
  }

}
