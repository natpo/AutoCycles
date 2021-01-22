module Graphics.AutoCycles where

import Graphics.UI.Gtk
import Sound.AutoCycles.Variables

hello :: (ButtonClass o) => o -> IO ()
hello b = set b [buttonLabel := "Hello World"]

openClient :: Variables -> IO ()
openClient v = do
  initGUI
  window <- windowNew
  hbox    <- hBoxNew True 10
  button1 <- buttonNewWithLabel "Button 1"
  button2 <- buttonNewWithLabel "Button 2"
  set window [ windowTitle := "AutoCycles 0.1.0"
             , windowResizable := True
             , windowDefaultWidth := 468
             , windowDefaultHeight := 552
             , containerChild := hbox
             , containerBorderWidth := 8 ]
  boxPackStart hbox button1 PackGrow 0
  boxPackStart hbox button2 PackGrow 0
  onClicked button1 (hello button1)
  onClicked button2 (hello button2)
  onDestroy window mainQuit
  widgetShowAll window
  mainGUI
