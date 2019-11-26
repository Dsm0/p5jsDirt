var socketId;

// Handle the "onReceive" event.
var onReceive = function(info) {
  if (info.socketId !== socketId)
    return;
  console.log(info.data);
};

// Create the Socket
chrome.sockets.udp.create({}, function(socketInfo) {
  socketId = socketInfo.socketId;
  // Setup event handler and bind socket.
  chrome.sockets.udp.onReceive.addListener(onReceive);
  chrome.sockets.udp.bind(socketId,
    "0.0.0.0", 0, function(result) {
      if (result < 0) {
        console.log("Error binding socket.");
        return;
      }
      chrome.sockets.udp.send(socketId, arrayBuffer,
        '127.0.0.1', 1337, function(sendInfo) {
          console.log("sent " + sendInfo.bytesSent);
      });
  });
});
