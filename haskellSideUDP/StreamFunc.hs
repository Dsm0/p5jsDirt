import Sound.OSC

-- Sound.OSC.Transport.FD.UDP

import Control.Concurrent

-- main = do
--   -- let t0 = udpServer "127.0.0.1" 57300
--   let t1 = openUDP "127.0.0.1" 57300
--   -- forkIO (O.withTransport t0 (\fd -> forever (O.recvMessage fd >>= print)))
--   O.withTransport t1 (\fd -> O.sendMessage fd (Packet.Message "/n" []))


main = do
  -- let t0 = udpServer "127.0.0.1" 57300
  let t1 = openUDP "127.0.0.1" 57300
  -- forkIO (O.withTransport t0 (\fd -> forever (O.recvMessage fd >>= print)))
  -- withTransport t1 (\fd -> sendMessage fd (Packet_Message "/n" []))

-- TODO!!!
-- figure out how to send OSC messages to p5.js over udp
-- ones that encapsulate javascript functions
