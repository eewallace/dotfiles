import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Run
import Data.Monoid
import System.Exit
import System.IO
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

main = do
  h <- spawnPipe "dzen2 -bg '#300a20' -fg '#999999' -w $(($SCREENW1*4/10)) -x $(($SCREENW1*3/10)) -ta c -sa c -e '' -fn '-*-inconsolata-medium-r-normal-*-*-*-*-*-*-*-iso8859-*' -xs 1"
  --h <- spawnPipe "dzen2 -bg '#300a20' -fg '#999999' -ta c -sa c -e '' -fn '-*-inconsolata-medium-r-normal-*-*-*-*-*-*-*-iso8859-*'"
  xmonad $ defaultConfig
    { terminal          = "sakura"
    , modMask           = mod1Mask
    , borderWidth       = 1
   -- , normalBorderColor = "#777777"
    , normalBorderColor = "#070707"
    , focusedBorderColor= "#c45a20"
    , workspaces        = myWorkspaces
    , focusFollowsMouse = False
    , keys              = \c -> myKeys c `M.union` keys defaultConfig c
    , manageHook        = myManageHook  <+> manageHook defaultConfig
    , layoutHook        = avoidStruts $ layoutHook defaultConfig
    , logHook           = dynamicLogWithPP $ defaultPP { ppOutput = hPutStrLn h }

--    , defaultGaps       = [(10,0,0,0)]
    }

myWorkspaces        = ["1:main","2:comm","3:web","4:code","5:music", "6:games","7","8","9"]

myManageHook = composeAll $
	wsShifts ++ wsFloats ++ [manageDocks]
	where
		wsShifts = 
		    [ appName =? "mail.google.com__mail" --> doShift (myWorkspaces !!1)
			, appName =? "www.pandora.com" --> doShift (myWorkspaces !! 4)
			, appName =? "Pidgin" --> doShift (myWorkspaces !! 1)
			, appName =? "Firefox" --> doShift (myWorkspaces !! 2)
			, appName =? "Chromium" --> doShift (myWorkspaces !! 2) ] 
		wsFloats = 
			[ className =? "Gimp-2.8" --> doFloat ] 

myKeys XConfig {XMonad.modMask = modm} = M.fromList $

    --dmenu
    [ ((modm,       xK_p), spawn "exe=`dmenu_path | dmenu -p \"I\'m on a menu.\" -fn '-*-inconsolata-medium-r-normal-*-*-*-*-*-*-*-iso8859-1' -nf '#999999' -nb '#300a20' -sf '#ffffff' -sb '#300a20'` && eval \"exec $exe\"")]

    ++

    --Audacious controls
    --Win+Space - play/pause
    --Win+Right - forward
    --Win+Left  - rewind
    [ ((mod4Mask,   xK_space), spawn "audacious -t")
    , ((mod4Mask,   xK_c)    , spawn "audacious -u")
    , ((mod4Mask,   xK_v)    , spawn "audacious -s")
    , ((mod4Mask,   xK_b)    , spawn "audacious -f")
    , ((mod4Mask,   xK_z)    , spawn "audacious -r")
    , ((mod4Mask,   xK_x)    , spawn "audacious -p")
    , ((mod4Mask,   xK_Right), spawn "audacious -f")
    , ((mod4Mask,   xK_Left ), spawn "audacious -r")
    ]

    ++

    --Volume controls:
    --XF86AudioRaiseVolume: Master +1
    --XF86AudioLowerVolume: Master -1
    --XF86AudioMute: Master Toggle
    --Win-Up: PCM +1
    --Win-Down: PCM -1
    [ ((0,          0x1008ff13), spawn "amixer set 'Master' 3+")
    , ((0,          0x1008ff11), spawn "amixer set 'Master' 3-")
    , ((0,          0x1008ff12), spawn "amixer set 'Master' toggle")
    , ((mod4Mask,   xK_Up     ), spawn "amixer set 'PCM' 3+")
    , ((mod4Mask,   xK_Down   ), spawn "amixer set 'PCM' 3-")
    ]

	++
	--Screenshots
	[ ((0, xK_Print), spawn "scrot")
	, ((controlMask, xK_Print), spawn "sleep 0.2;scrot -s")
	]
