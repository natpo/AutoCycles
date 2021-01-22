{-# LANGUAGE OverloadedStrings #-}

module Sound.AutoCycles.Session where

import Control.Concurrent
import Control.Concurrent.MVar (readMVar)
import Sound.AutoCycles.Tidal
import Sound.AutoCycles.Variables
import Sound.Tidal.Context

import qualified Sound.OSC.FD as O

openSession :: Variables -> IO ()
openSession v = do tidal <- readMVar $ tidalMV v

                   streamReplace tidal 1 . (|< orbit 0) $ sound "bd"
                   streamReplace tidal 2 . (|< orbit 1) $ sound "<~ sd>"
                   streamReplace tidal 3 . (|< orbit 2) $ sound "hh hh hh hh"

                   setTempo tidal $ 4
