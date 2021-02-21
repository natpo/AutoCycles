module Graphics.AutoCycles where

import Graphics.UI.Gtk
import Sound.AutoCycles.Variables

openClient :: Variables -> IO ()
openClient v = do
  initGUI
  window  <- windowNew
  hbox    <- hBoxNew True 10
  button1 <- buttonNewWithLabel "Fullscreen"
  button2 <- buttonNewWithLabel "Windowed"
  set window [ windowTitle := "AutoCycles 0.1.0"
             , windowResizable := True
             , windowDefaultWidth := 1920
             , windowDefaultHeight := 1080
             , containerChild := hbox
             , containerBorderWidth := 8 ]
  boxPackStart hbox button1 PackGrow 0
  boxPackStart hbox button2 PackGrow 0
  onClicked button1 (windowFullscreen window)
  onClicked button2 (windowUnfullscreen window)
  onDestroy window mainQuit
  widgetShowAll window
  mainGUI
