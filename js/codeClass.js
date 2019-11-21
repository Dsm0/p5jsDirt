class Code{

  constructor(code){
    this.rawCode = code

    //

    this.parsedFunction = this.parseCode(code)
    this.args = ["Find some way to get defined args from the func"]
              // ^^^^ might actually want to call this inside parseCode
    this.defaultParams = {"param" : "valueOfParam",
                          "param2" : "gain" //could set default of a func param to be
                                            //some tidal param
                          }

  }


// make this function a static class function
  parseCode(code){
    // make sure that when the code is parsed, it's turned into a javascript function
    // that takes one dictionary as an argument
    // (turn all arguments defined in P5.hs into dictionary calls,
    // where each argument becomes a key name)
    return "Not Implemented!!!!"
  }

  draw(thing){
    args = this.args;
    drawParams = {};
    for (i = 0;
    i < this.args.length
    ; i++) {
      drawParams[args[i]] = thing.get(args[i])
      if (drawParams[args[i]] == null) {
        drawParams[args[i]] = this.defaultParams[args[i]];
      }
    this.parsedFunction(drawParams);
    }
