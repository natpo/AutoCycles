module Sound.AutoCycles.Variables where

import Control.Concurrent.MVar (MVar, newMVar, readMVar)
import Data.Map                (Map)
import Sound.Tidal.Config
import Sound.Tidal.Stream

data DeviceChannel = String String Int

data Variables = Variables { tidalMV :: MVar Stream }

type Response = Variables -> IO ()

variables :: IO Variables
variables = do tidal <- startTidal superdirtTarget defaultConfig

               tidalMV <- newMVar tidal

               return Variables { tidalMV = tidalMV }
