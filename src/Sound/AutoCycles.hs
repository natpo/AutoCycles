module Sound.AutoCycles where

import Sound.AutoCycles.Constants
import Sound.AutoCycles.IO
import Sound.AutoCycles.Session
import Sound.AutoCycles.Variables

bootServer :: Response -> IO ()
bootServer openClient = do
  v <- variables
  openSession v
  openClient v
