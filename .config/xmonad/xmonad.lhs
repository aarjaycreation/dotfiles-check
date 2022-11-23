\documentclass[a4paper]{article}
\usepackage[a4paper,left=3cm,right=2cm,top=2.5cm,bottom=2.5cm]{geometry}
%include polycode.fmt
\title{\Huge{XMonad config}}
\author{\Huge{Afonso Franco}}

\begin{document}
\maketitle
\newpage
\tableofcontents
\pagebreak

\subsection{Imports}
\begin{code}
 {-# OPTIONS_GHC -Wno-deprecations #-}

 import XMonad
 import XMonad.Util.EZConfig (additionalKeysP,removeKeysP)
 import XMonad.Hooks.DynamicLog
 import XMonad.Util.Loggers (logLayoutOnScreen, logTitleOnScreen, shortenL, wrapL, xmobarColorL)
 import XMonad.Hooks.SetWMName
 import XMonad.Actions.SpawnOn
 import XMonad.Hooks.StatusBar
 import qualified XMonad.StackSet as W
 import XMonad.Hooks.EwmhDesktops
 import XMonad.Util.Run
 import Data.Maybe (fromJust)
 import XMonad.Hooks.ManageDocks
 import XMonad.Hooks.ManageHelpers
 import Data.Monoid
 import Colors.Teal
 import System.Exit
 import XMonad.Util.SpawnOnce
 import XMonad.Layout.Spacing
 import XMonad.Hooks.WindowSwallowing
 import qualified XMonad.StackSet as W
 import qualified Data.Map        as M
\end{code}

\subsection{Config Values}
\subsubsection{App Variables}
\begin{code}
 myTerminal      = "alacritty" 
 myTextEditor    = "vim"
 myWebBrowser    = "firefox"
\end{code}

\subsubsection{Window/Workspace Variables}
 Whether focus follows the mouse pointer.

>myFocusFollowsMouse :: Bool
>myFocusFollowsMouse = True

 Whether clicking on a window to focus also passes the click to the window

>myClickJustFocuses :: Bool
>myClickJustFocuses = False

>windowCount :: X (Maybe String)
>windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

>myNormalBorderColor  = "#008080"
>myFocusedBorderColor = "#01F9C6"

>myBorderWidth   = 2

>myWorkspaces    = ["main","web","text","code","social","mail"]
>myWorkspaceIndices = M.fromList $ zipWith (,) myWorkspaces [1..]


\subsubsection{Keybindings}

>myModMask       = mod4Mask
>myKeys :: [(String, X ())]
>myKeys =

 launch a terminal

>    [ ("M-x" ,spawn myTerminal )

 launch rofi

>    , ("M-p", spawn "rofi -show drun")

 launch web browser

>    , ("M-b", spawn myWebBrowser)

    
Screenshot

>   , ("<Print>", spawn "flameshot screen")
>    , ("S-<Print>", spawn "flameshot gui")

AUDIO CONTROLS

>    , ("<XF86AudioMute>", spawn "pamixer set --toggle-mute")
>    , ("<XF86AudioLowerVolume>", spawn "pamixer -d 5")
>    , ("<XF86AudioRaiseVolume>", spawn "pamixer -i 5")

brightness controls

>    ,("<XF86MonBrightnessUp>", spawn "lux -a 10%")
>    ,("<XF86MonBrightnessDown>", spawn "lux -s 10%")

network manager

>    ,("M-n", spawn $ myTerminal ++  " -e nmtui")

 close focused window

>    , ("M-q", kill)

  Reset the layouts on the current workspace to default

>    , ("M-S-<Space>", sendMessage NextLayout)

 Move focus to the next window

>    , ("M-<Down>", windows W.focusDown)

 Move focus to the previous window

>    , ("M-<Up>", windows W.focusUp  )

 Move focus to the master window

>    , ("M-m", windows W.focusMaster  )

 Swap the focused window and the master window

>    , ("M-<Return>", windows W.swapMaster)

 Shrink the master area

>    , ("M-h", sendMessage Shrink)

 Expand the master area

>    , ("M-l", sendMessage Expand)

 Push window back into tiling

>    , ("M-t", withFocused $ windows . W.sink)

 Quit xmonad

>    , ("M-S-u", io (exitWith ExitSuccess))

    Restart xmonad

>    , ("M-u", spawn "xmonad --recompile; xmonad --restart")
>    ]
>    ++

    Switch Worskapce with Windows + [1..6]. Shift window adding Shift key.

>    [("M-" ++ m ++ (show k), windows $ f i)
>        | (i, k) <- zip myWorkspaces [1..]
>        , (f, m) <- [(W.greedyView, "0"), (W.shift, "S-")]]
>    ++

    Switch Screen with Windows + [w,e,r]. Shift window adding Shift key.

>    [("M-" ++ m ++ key, screenWorkspace sc >>= flip whenJust (windows . f))
>        | (key, sc) <- zip ["w", "e", "r"] [0..]
>        , (f, m) <- [(W.view, "0"), (W.shift, "S-")]]

Default Keys to be removed

>myRemoveKeys = ["M-S-<Return>","M-S-p","M-S-c","M-<Space>","M-n","M-S-q"]

Mouse bindings: default actions bound to mouse events

>myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

mod-button1, Set the window to floating mode and move by dragging

>    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
>                                      >> windows W.shiftMaster))

mod-button2, Raise the window to the top of the stack

>    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

mod-button3, Set the window to floating mode and resize by dragging

>    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
>                                       >> windows W.shiftMaster))]


\subsubsection{Mousebindings}

>myLayout = avoidStruts(tiled ||| Mirror tiled ||| Full)
>  where

default tiling algorithm partitions the screen into two panes

>     tiled   = Tall nmaster delta ratio

The default number of windows in the master pane

>     nmaster = 1

Default proportion of screen occupied by master pane

>     ratio   = 1/2

Percent of screen to increment by when resizing panes

>     delta   = 3/100

\subsubsection{Manage Windows Hook}
\begin{code}
 myManageHook = composeAll
   [ className =? "MPlayer"        --> doFloat
   , className =? "Gimp"           --> doFloat
   , resource  =? "desktop_window" --> doIgnore
   , className =? "QjackCtl"       --> doFloat    
   , resource  =? "kdesktop"       --> doIgnore
   , className =? "firefox"        --> doShift (myWorkspaces !! 1)
   , className =? "Code"        --> doShift (myWorkspaces !! 3)
   , className =? "discord"        --> doShift (myWorkspaces !! 4)
   , title     =? "JetBrains Toolbox" --> doShift (myWorkspaces !! 3)
   , className =? "main" --> doFloat
   , className =? "Mailspring"  --> doShift (myWorkspaces !! 5)
   , className =? "Xmessage" --> doFloat
   , isFullscreen -->  doFullFloat]
\end{code}

\subsubsection{Event Hook}

>myEventHook = ewmhDesktopsEventHook

\subsubsection{Startup Hook}
\begin{code}
 myStartupHook = do
       spawnOnce "pasystray"
       spawnOnce "nitrogen --restore &"
       spawnOnce "playerctld"
       spawnOnce "picom &"
       spawnOnce "optimus-manager-qt"
       setWMName "LG3D"
       spawnOnce "nm-applet"
       spawnOnce "mailspring"
       spawnOnce("xsetroot -cursor_name left_ptr")
       spawn ("killall trayer ;sleep 1 && trayer --monitor 0 --edge top --align right --widthtype request --padding 7 --iconspacing 12 --SetDockType true --SetPartialStrut true --expand true --transparent true --alpha 0 --tint 0x2B2E37  --height 26 --distance 5 &")
       spawnOn "web" myWebBrowser
       spawnOn "main" myTerminal

\end{code}


\subsection{Xmobar}


\begin{code}

 actionPrefix, actionButton, actionSuffix :: [Char]
 actionPrefix = "<action=`xdotool key super+"
 actionButton = "` button="
 actionSuffix = "</action>"
 
 addActions :: [(String, Int)] -> String -> String
 addActions [] ws = ws
 addActions (x:xs) ws = addActions xs (actionPrefix ++ k ++ actionButton ++ show b ++ ">" ++ ws ++ actionSuffix)
    where k = fst x
          b = snd x

 clickable :: [Char] -> [Char] -> [Char]
 clickable icon ws = addActions [ (show i, 1), ("q", 2), ("Left", 4), ("Right", 5) ] icon
                    where i = fromJust $ M.lookup ws myWorkspaceIndices

 myStatusBarSpawner :: Applicative f => ScreenId -> f StatusBarConfig
 myStatusBarSpawner (S s) = do
                    pure $ statusBarPropTo ("_XMONAD_LOG_" ++ show s)
                          ("xmobar -x " ++ show s ++ " ~/.config/xmobar/xmobarrc" ++ show s)
                          (pure $ myXmobarPP (S s))


 myXmobarPP :: ScreenId -> PP
 myXmobarPP s  =  def
  { ppSep = ""
  , ppWsSep = ""
  , ppCurrent = xmobarColor cyan "" . clickable wsIconFull
  , ppVisible = xmobarColor grey4 "" . clickable wsIconFull
  , ppVisibleNoWindows = Just (xmobarColor grey4 "" . clickable wsIconFull)
  , ppHidden = xmobarColor grey2 "" . clickable wsIconHidden
  , ppHiddenNoWindows = xmobarColor grey2 "" . clickable wsIconEmpty
  , ppUrgent = xmobarColor orange "" . clickable wsIconFull
  , ppOrder = \(ws : _ : _ : extras) -> ws : extras
  , ppExtras  = [ wrapL "    " "    " $ layoutColorIsActive s (logLayoutOnScreen s)
                ,titleColorIsActive s (shortenL 81 $ logTitleOnScreen s)
                ]
  }
   where
    wsIconFull   = "  <fn=2>\xf111</fn>   "
    wsIconHidden = "  <fn=2>\xf111</fn>   "
    wsIconEmpty  = "  <fn=2>\xf10c</fn>   "
    titleColorIsActive n l = do
      c <- withWindowSet $ return . W.screen . W.current
      if n == c then xmobarColorL cyan "" l else xmobarColorL grey3 "" l
    layoutColorIsActive n l = do
      c <- withWindowSet $ return . W.screen . W.current
      if n == c then wrapL "<icon=/home/afonso/.config/xmobar/xpm/" "_selected.xpm/>" l else wrapL "<icon=/home/afonso/.config/xmobar/xpm/" ".xpm/>" l

\end{code}


\subsection{Config Binding}
\begin{code}
 myConfig =  def
       {
       terminal           = myTerminal,
       focusFollowsMouse  = myFocusFollowsMouse,
       clickJustFocuses   = myClickJustFocuses,
       borderWidth        = myBorderWidth,
       modMask            = myModMask,
       workspaces         = myWorkspaces,
       normalBorderColor  = myNormalBorderColor,
       focusedBorderColor = myFocusedBorderColor,
      -- keys               = myKeys,
       layoutHook         = spacingWithEdge 10 $ myLayout,
       manageHook         = manageSpawn <+> myManageHook <+> manageHook def,
       handleEventHook    = myEventHook <+> fullscreenEventHook <+> swallowEventHook (className=?"Alacritty") (return True) ,
       startupHook        = myStartupHook}
\end{code}

\subsection{Main}
\begin{code}
 main :: IO ()
 main = do
        xmonad . ewmh . ewmhFullscreen . dynamicSBs myStatusBarSpawner . docks $ additionalKeysP (removeKeysP myConfig myRemoveKeys) myKeys
\end{code}

\subsection{Default Bindings}
\begin{code}
 help :: String
 help = unlines ["The default modifier key is 'alt'. Default keybindings:",
     "",
     "-- launching and killing programs",
     "mod-Shift-Enter  Launch xterminal",
     "mod-p            Launch dmenu",
     "mod-Shift-p      Launch gmrun",
     "mod-Shift-c      Close/kill the focused window",
     "mod-Space        Rotate through the available layout algorithms",
     "mod-Shift-Space  Reset the layouts on the current workSpace to default",
     "mod-n            Resize/refresh viewed windows to the correct size",
     "",
     "-- move focus up or down the window stack",
     "mod-Tab        Move focus to the next window",
     "mod-Shift-Tab  Move focus to the previous window",
     "mod-j          Move focus to the next window",
     "mod-k          Move focus to the previous window",
     "mod-m          Move focus to the master window",
     "",
     "-- modifying the window order",
     "mod-Return   Swap the focused window and the master window",
     "mod-Shift-j  Swap the focused window with the next window",
     "mod-Shift-k  Swap the focused window with the previous window",
     "",
     "-- resizing the master/slave ratio",
     "mod-h  Shrink the master area",
     "mod-l  Expand the master area",
     "",
     "-- floating layer support",
     "mod-t  Push window back into tiling; unfloat and re-tile it",
     "",
     "-- increase or decrease number of windows in the master area",
     "mod-comma  (mod-,)   Increment the number of windows in the master area",
     "mod-period (mod-.)   Deincrement the number of windows in the master area",
     "",
     "-- quit, or restart",
     "mod-Shift-q  Quit xmonad",
     "mod-q        Restart xmonad",
     "mod-[1..9]   Switch to workSpace N",
     "",
     "-- Workspaces & screens",
     "mod-Shift-[1..9]   Move client to workspace N",
     "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
     "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
     "",
     "-- Mouse bindings: default actions bound to mouse events",
     "mod-button1  Set the window to floating mode and move by dragging",
     "mod-button2  Raise the window to the top of the stack",
     "mod-button3  Set the window to floating mode and resize by dragging"]
\end{code}
\end{document}
