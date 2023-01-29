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

myTerminal      = "alacritty" 
myTextEditor    = "nvim"
myWebBrowser    = "firefox"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myClickJustFocuses :: Bool
myClickJustFocuses = False

windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

myNormalBorderColor  = "#008080"
myFocusedBorderColor = "#01F9C6"

myBorderWidth   = 2

myWorkspaces    = ["main","web","text","code","social","mail"]

myWorkspaceIndices = M.fromList $ zipWith (,) myWorkspaces [1..]

myModMask       = mod4Mask

myKeys :: [(String, X ())]
myKeys =
    [ ("M-x" ,spawn myTerminal )
    , ("M-p", spawn "rofi -show drun")
    , ("M-s", spawn "selected=$(ls ~/scripts/|rofi -dmenu -p \"Run: \") && bash ~/.config/rofi/scripts/$selected")
    , ("M-b", spawn myWebBrowser)
   , ("<Print>", spawn "flameshot gui")
    , ("<XF86AudioMute>", spawn "pamixer set --toggle-mute")
    , ("<XF86AudioLowerVolume>", spawn "pamixer -d 5")
    , ("<XF86AudioRaiseVolume>", spawn "pamixer -i 5")
    ,("<XF86MonBrightnessUp>", spawn "lux -a 10%")
    ,("<XF86MonBrightnessDown>", spawn "lux -s 10%")
    ,("M-n", spawn $ myTerminal ++  " -e nmtui")
    , ("M-q", kill)
    , ("M-S-<Space>", sendMessage NextLayout)
    , ("M-<Down>", windows W.focusDown)
    , ("M-<Up>", windows W.focusUp  )
    , ("M-m", windows W.focusMaster  )
    , ("M-<Return>", windows W.swapMaster)
    , ("M-h", sendMessage Shrink)
    , ("M-l", sendMessage Expand)
    , ("M-t", withFocused $ windows . W.sink)
    , ("M-S-u", io (exitWith ExitSuccess))
    , ("M-u", spawn "xmonad --recompile; xmonad --restart")
    ]
    ++
    [("M-" ++ m ++ (show k), windows $ f i)
        | (i, k) <- zip myWorkspaces [1..]
        , (f, m) <- [(W.greedyView, "0"), (W.shift, "S-")]]
    ++
    [("M-" ++ m ++ key, screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip ["w", "e", "r"] [0..]
        , (f, m) <- [(W.view, "0"), (W.shift, "S-")]]

myRemoveKeys = ["M-S-<Return>","M-S-p","M-S-c","M-<Space>","M-n","M-S-q"]
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                      >> windows W.shiftMaster))
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))]

myLayout = avoidStruts(tiled ||| Mirror tiled ||| Full)
  where
     tiled   = Tall nmaster delta ratio
     nmaster = 1
     ratio   = 1/2
     delta   = 3/100

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
  , title     =? "Steam - News" --> doFloat
  , title     =? "Friends List" --> doFloat
  , isFullscreen -->  doFullFloat]

myEventHook = ewmhDesktopsEventHook
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

myStatusBarSpawner :: Applicative f => ScreenId -> f StatusBarConfig
myStatusBarSpawner (S s) = do
                   pure $ statusBarPropTo ("_XMONAD_LOG_" ++ show s)
                         ("xmobar -x " ++ show s ++ " ~/.config/xmobar/xmobarrc" ++ show s)
                         (pure $ myXmobarPP (S s))


myXmobarPP :: ScreenId -> PP
myXmobarPP s  =  def
 { ppSep = ""
 , ppWsSep = ""
 , ppCurrent = xmobarColor cyan "" . const wsIconFull
 , ppVisible = xmobarColor grey4 "" . const wsIconFull
 , ppVisibleNoWindows = Just (xmobarColor grey4 "" . const wsIconFull)
 , ppHidden = xmobarColor grey2 "" . const wsIconHidden
 , ppHiddenNoWindows = xmobarColor grey2 "" . const wsIconEmpty
 , ppUrgent = xmobarColor orange "" . const wsIconFull
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

main :: IO ()
main = do
       xmonad . ewmh . ewmhFullscreen . dynamicSBs myStatusBarSpawner . docks $ additionalKeysP (removeKeysP myConfig myRemoveKeys) myKeys

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

