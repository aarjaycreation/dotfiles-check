-- xmonad example config file.
--
-- A template showing all available configuration hooks,
--
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--

{-# OPTIONS_GHC -Wno-deprecations #-}

import XMonad
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.SetWMName
import XMonad.Actions.SpawnOn
import qualified XMonad.StackSet as W
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.Run
import Data.Maybe (fromJust)
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import Data.Monoid
import Colors.DoomOne
import System.Exit
import XMonad.Util.SpawnOnce
import XMonad.Layout.Spacing
--import XMonad.Layout.Fullscreen
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
-- Personal Variables
myTerminal      = "alacritty" 
myTextEditor    = "leafpad"
myWebBrowser    = "firefox"


-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset


-- Width of the window border in pixels.
--
myBorderWidth   = 2

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask       = mod4Mask

-- The default number of workspaces (virtual screens) and their names.

myWorkspaces    = ["main","web","text","code","social","mail"]
myWorkspaceIndices = M.fromList $ zipWith (,) myWorkspaces [1..]

clickable ws = "<action=xdotool key super+"++show i++">"++ws++"</action>"
    where i = fromJust $ M.lookup ws myWorkspaceIndices


-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#282c34"
myFocusedBorderColor = "#46d9ff"

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys :: [(String, X ())]
myKeys =
    -- launch a terminal
    [ ("M-x" ,spawn myTerminal )

    -- launch dmenu
    , ("M-p", spawn "dmenu_run")

    -- launch web browser
    , ("M-b", spawn myWebBrowser)
    
    --Screenshot
    , ("<Print>", spawn "flameshot screen")
    , ("S-<Print>", spawn "flameshot gui")
    --AUDIO CONTROLS
    , ("<XF86AudioMute>", spawn "pamixer set --toggle-mute")
    , ("<XF86AudioLowerVolume>", spawn "pamixer -d 5")
    , ("<XF86AudioRaiseVolume>", spawn "pamixer -i 5")

    --brightness controls
    ,("<xf86monbrightnessup>", spawn "lux -a 10%")
    ,("<xf86monbrightnessdown>", spawn "lux -s 10%")
    
    --CHANGE KEYBOARD LAYOUT
    ,("M-<Space>", spawn "/bin/zsh /home/afonso/.config/xmonad/change-kb.sh")

    --brightness controls
    ,("M-n", spawn "kitty -e nmtui")
    
    -- close focused window
    , ("M-q", kill)

    --  Reset the layouts on the current workspace to default
    , ("M-S-<Space>", sendMessage NextLayout)

    -- Move focus to the next window
    , ("M-<Down>", windows W.focusDown)

    -- Move focus to the previous window
    , ("M-<Up>", windows W.focusUp  )

    -- Move focus to the master window
    , ("M-m", windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ("M-<Return>", windows W.swapMaster)

    -- Shrink the master area
    , ("M-h", sendMessage Shrink)

    -- Expand the master area
    , ("M-l", sendMessage Expand)

    -- Push window back into tiling
    , ("M-t", withFocused $ windows . W.sink)

    -- Quit xmonad
    , ("M-S-u", io (exitWith ExitSuccess))

    -- Restart xmonad
    , ("M-u", spawn "xmonad --recompile; xmonad --restart")
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [("M-" ++ m ++ (show k), windows $ f i)
        | (i, k) <- zip myWorkspaces [1..]
        , (f, m) <- [(W.greedyView, "0"), (W.shift, "S-")]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [("M-" ++ m ++ key, screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip ["w", "e", "r"] [0..]
        , (f, m) <- [(W.view, "0"), (W.shift, "S-")]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-r') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout = avoidStruts(tiled ||| Mirror tiled ||| Full)
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--

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
------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = ewmhDesktopsEventHook

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
--myLogHook = return ()

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = do
        spawn ("killall trayer")
        spawnOnce "nitrogen --restore &"
        spawnOnce "picom &"
        setWMName "LG3D"
        spawnOnce "nm-applet"
        spawn "mailspring"
        spawnOnce "qjackctl"
        spawn("xsetroot -cursor_name left_ptr")
        spawn ("easyeffects --gapplication-service")
	spawnOnce "optimus-manager-qt"
        spawn ("sleep 2 && trayer --edge top --align right --widthtype request --margin 7 --padding 6 --SetDockType true --SetPartialStrut true --iconspacing 6 --expand true --monitor 0 --transparent true --alpha 0 " ++ colorTrayer ++ " --height 24 --distance 50 --distancefrom right")
        spawn ("albert")
	spawnOn "web" "firefox"
        spawnOn "main" myTerminal
------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main :: IO ()
main = do
      xmproc <- spawnPipe "xmobar -x 0 ~/.config/xmobar/xmobarrc" -- launch on monitor 1
      xmonad $ ewmh $  ewmhFullscreen $ docks $ def
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
        mouseBindings      = myMouseBindings,
        layoutHook         = spacingWithEdge 10 $ myLayout,
        manageHook         = manageSpawn <+> myManageHook <+> manageHook def,
        handleEventHook    = myEventHook <+> fullscreenEventHook,
        logHook            = dynamicLogWithPP $ xmobarPP
              { ppOutput = \x -> hPutStrLn xmproc x   -- xmobar on monitor 1
                -- Current workspace
              , ppCurrent = xmobarColor color06 "" . wrap
                            ("<box type=Bottom width=2 mb=2 color=" ++ color06 ++ ">") "</box>"
                -- Visible but not current workspace
              , ppVisible = xmobarColor color06 "" . clickable
                -- Hidden workspace
              , ppHidden = xmobarColor color05 "" . wrap
                           ("<box type=Top width=2 mt=2 color=" ++ color05 ++ ">") "</box>" . clickable
                -- Hidden workspaces (no windows)
              , ppHiddenNoWindows = xmobarColor color05 ""  . clickable
                -- Title of active window
              , ppTitle = xmobarColor color16 "" . shorten 60
                -- Separator character
              , ppSep =  "<fc=" ++ color09 ++ "> <fn=1>|</fn> </fc>"
                -- Urgent workspace
              , ppUrgent = xmobarColor color02 "" . wrap "!" "!"
                -- Adding # of windows on current workspace to the bar
              , ppExtras  = [windowCount]
                -- order of things in xmobar
              , ppOrder  = \(ws:l:t:ex) -> [ws]++ex++[t]
              }
        ,startupHook        = myStartupHook
} `additionalKeysP` myKeys

-- | Finally, a copy of the default bindings in simple textual tabular format.
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
