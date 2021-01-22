module Sound.AutoCycles.Tidal where

import           Control.Concurrent.MVar (readMVar)
import           Sound.OSC.FD            (time)
import           Sound.Tidal.Context
import qualified Sound.Tidal.Tempo       as Tempo

setTempo tidal = (streamOnce tidal) . cps

getTempo tidal = do tempo <- readMVar $ sTempoMV tidal
                    return $ Tempo.cps tempo

getNow tidal = do tempo <- readMVar $ sTempoMV tidal
                  now <- time
                  return $ fromRational $ Tempo.timeToCycles tempo now
