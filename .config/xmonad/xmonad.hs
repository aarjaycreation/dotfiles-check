{-# OPTIONS_GHC -Wno-deprecations #-}


import XMonad

--Utils
import XMonad.Util.EZConfig (additionalKeysP,removeKeysP)
import XMonad.Util.Loggers (logLayoutOnScreen, logTitleOnScreen, shortenL, wrapL, xmobarColorL)
import XMonad.Util.Run
import XMonad.Util.SpawnOnce

--Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Hooks.StatusBar
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.WindowSwallowing

--Actions
import XMonad.Actions.SpawnOn
import XMonad.Actions.UpdateFocus (focusUnderPointer)

--Layouts
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing


-- MultiMonitorFocusHook
import Control.Monad (when)
import Data.Foldable (find)
import Foreign.C (CInt)
import Data.Maybe (fromMaybe)
import Data.Monoid (All (All))

--Miscellaneous
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import System.Exit

--Color Scheme
import Colors.Teal



myTerminal      = "kitty" 
myTerminalTmux  = myTerminal ++ " -e tmux a"
myTextEditor    = "nvim"
myWebBrowser    = "firefox"
myModMask       = mod4Mask

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myClickJustFocuses :: Bool
myClickJustFocuses = False

windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

myNormalBorderColor  = "#008080"
myFocusedBorderColor = "#01F9C6"

myBorderWidth   = 2

myWorkspaces    = ["main","web","text","code","social","monitoring"]
myWorkspaceIndices = zip myWorkspaces [1..]


myKeys :: [(String, X ())]
myKeys =
    [ ("M-x" ,spawn myTerminalTmux )
    , ("M-p", spawn "rofi -show drun -show-icons")
    , ("M-S-p", spawn "rofi -show p -modi p:rofi-power-menu")
    , ("M-s", spawn "selected=$(ls ~/scripts/|rofi -dmenu -p \"Run: \") && bash ~/.config/rofi/scripts/$selected")
    , ("M-b", spawn myWebBrowser)
    , ("<Print>", spawn "flameshot gui")
    , ("<XF86AudioMute>", spawn "pamixer set --toggle-mute")
    , ("<XF86AudioLowerVolume>", spawn "pamixer -d 5")
    , ("<XF86AudioRaiseVolume>", spawn "pamixer -i 5")
    , ("<XF86MonBrightnessUp>", spawn "lux -a 10%")
    , ("<XF86MonBrightnessDown>", spawn "lux -s 10%")
    , ("M-n", spawn $ myTerminal ++  " -e nmtui")
    , ("M-q",  kill)
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
        | (i, k) <- myWorkspaceIndices
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
    setWMName "LG3D"
    spawnOnce "nm-applet"
    spawnOnce ("xsetroot -cursor_name left_ptr")
    spawnOnce ("killall trayer ;sleep 1 && trayer --monitor 0 --edge top --align right --margin 4 --widthtype request --padding 8 --iconspacing 12 --SetDockType true --SetPartialStrut true --expand true --transparent true --alpha 0 --tint 0x2B2E37  --height 30 --distance 5 &")
    spawnOnce ("slimbookbattery --minimize")
    spawnOnOnce "web" myWebBrowser
    spawnOnOnce "main" myTerminalTmux


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
    layoutHook         = smartBorders . spacingWithEdge 15 $ myLayout,
    manageHook         = manageSpawn <+> myManageHook <+> manageHook def,
    handleEventHook    = myEventHook <+> fullscreenEventHook <+> swallowEventHook (className=?"Alacritty") (return True),
    startupHook        = myStartupHook
    }


main :: IO ()
main = xmonad . ewmh . ewmhFullscreen . dynamicSBs myStatusBarSpawner . docks $ additionalKeysP (removeKeysP myConfig myRemoveKeys) myKeys