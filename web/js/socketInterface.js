var socketIO = socketIO || {};

(function () {
    "use strict";

    socketIO.SocketWebOsc= function () {
        this.oscPort = new osc.WebSocketPort({
            url: "ws://localhost:8081"
        });

        this.listen();
        this.oscPort.open();

    };

    socketIO.SocketWebOsc.prototype.listen = function () {

        this.oscPort.on("message", function (msg) {

            oscEvent(msg);

        });

    };

}());
