module Main where

import Graphics.AutoCycles
import Sound.AutoCycles

main :: IO ()
main = bootServer openClient
