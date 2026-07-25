-- ╔══════════════════════════════════════════════════════════════════╗
-- ║                         Keybindings                             ║
-- ╚══════════════════════════════════════════════════════════════════╝

local settings = require("modules.settings")
local mainMod = "SUPER"

-- ── Built-in Gestures (3-finger / 4-finger) ─────────────────────
hl.gesture({ fingers = 3, direction = "vertical", action = "workspace" })
hl.gesture({ fingers = 3, direction = "horizontal", action = "scroll_move" })
hl.gesture({ fingers = 3, direction = "pinch", action = "close" })
hl.gesture({
	fingers = 4,
	direction = "left",
	action = function()
		hl.exec_cmd(settings.fileManager)
	end,
})
hl.gesture({
	fingers = 4,
	direction = "right",
	action = function()
		hl.exec_cmd("obsidian")
	end,
})
hl.gesture({
	fingers = 4,
	direction = "down",
	action = function()
		hl.exec_cmd(settings.menu)
	end,
})
hl.gesture({
	fingers = 4,
	direction = "up",
	action = function()
		hl.exec_cmd(settings.alternate_browser)
	end,
})

-- ═══════════════════════════════════════════════════════════════════
-- §1  Application Launchers
-- ═══════════════════════════════════════════════════════════════════

-- Terminal
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(settings.terminal))

-- File manager in terminal
hl.bind(mainMod .. " + CTRL + Return", hl.dsp.exec_cmd(settings.terminal .. " -e yazi"))

-- Browsers
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(settings.browser))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(settings.alternate_browser))

-- App launcher (rofi)
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("pkill rofi || rofi -show run"))
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd("pkill rofi || search_launcher.sh"))

-- Notification center
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"))

-- Which-key menus
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("wlr-which-key -k r"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("wlr-which-key -k e"))

-- ═══════════════════════════════════════════════════════════════════
-- §2  Session Management
-- ═══════════════════════════════════════════════════════════════════

hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("wlogout -C /home/shivank/.config/wlogout/nova.css"))
hl.bind(mainMod .. " + F11", hl.dsp.exec_cmd("gamemode.sh"))
hl.bind(mainMod .. " + F12", hl.dsp.exec_cmd("randomiseWallpaper.sh"))

-- ═══════════════════════════════════════════════════════════════════
-- §3  Window Management
-- ═══════════════════════════════════════════════════════════════════

-- Close active window
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.close())

-- Toggle waybar visibility
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))

-- Pin / Float / Pseudo
hl.bind(mainMod .. " + P", hl.dsp.window.pin())
hl.bind(mainMod .. " + V", hl.dsp.window.float())
hl.bind(mainMod .. " + D", hl.dsp.window.pseudo())

-- ═══════════════════════════════════════════════════════════════════
-- §4  Scrolling Layout Controls
-- ═══════════════════════════════════════════════════════════════════

-- Fullscreen modes
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = 0 }))
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 2 }))

-- Column resize: cycle through explicit widths
hl.bind(mainMod .. " + T", hl.dsp.layout("colresize +conf"))

-- Fit visible columns
hl.bind(mainMod .. " + O", hl.dsp.layout("fit visible"))

-- Fine-grained column resize
hl.bind(mainMod .. " + equal", hl.dsp.layout("colresize +0.05"))
hl.bind(mainMod .. " + minus", hl.dsp.layout("colresize -0.05"))

-- ═══════════════════════════════════════════════════════════════════
-- §5  Focus Navigation
-- ═══════════════════════════════════════════════════════════════════

-- Scrolling layout: move columns left/right
hl.bind(mainMod .. " + L", hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + H", hl.dsp.layout("move -col"))

-- Standard focus up/down
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))

-- Cycle through windows
hl.bind(mainMod .. " + TAB", hl.dsp.window.cycle_next({}))

-- ═══════════════════════════════════════════════════════════════════
-- §6  Window Movement
-- ═══════════════════════════════════════════════════════════════════

-- Swap columns in scrolling layout
hl.bind(mainMod .. " + CTRL + L", hl.dsp.layout("swapcol r"))
hl.bind(mainMod .. " + CTRL + H", hl.dsp.layout("swapcol l"))

-- Move window in direction
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))

-- ═══════════════════════════════════════════════════════════════════
-- §7  Workspace Switching (SUPER + 1-0)
-- ═══════════════════════════════════════════════════════════════════

-- Keys 1-9 map to workspaces 1-9, key 0 maps to workspace 10
local wsKeys = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" }
for i, key in ipairs(wsKeys) do
	local ws = (i == 10) and 10 or i

	-- Switch to workspace
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = ws }))

	-- Move window to workspace (and follow)
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = ws, follow = true }))

	-- Move window to workspace silently
	hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = ws, follow = false }))
end

-- Relative workspace switching with brackets [ ]
hl.bind(mainMod .. " + bracketleft", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + bracketright", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + SHIFT + bracketleft", hl.dsp.window.move({ workspace = "-1", follow = true }))
hl.bind(mainMod .. " + SHIFT + bracketright", hl.dsp.window.move({ workspace = "+1", follow = true }))
hl.bind(mainMod .. " + CTRL + bracketleft", hl.dsp.window.move({ workspace = "-1", follow = false }))
hl.bind(mainMod .. " + CTRL + bracketright", hl.dsp.window.move({ workspace = "+1", follow = false }))

-- ═══════════════════════════════════════════════════════════════════
-- §8  Special Workspaces (Scratchpads)
-- ═══════════════════════════════════════════════════════════════════

hl.bind(mainMod .. " + X", hl.dsp.workspace.toggle_special("firstmagic"))
hl.bind(mainMod .. " + Z", hl.dsp.workspace.toggle_special("secondmagic"))
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.window.move({ workspace = "special:firstmagic", follow = false }))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.window.move({ workspace = "special:secondmagic", follow = false }))

-- ═══════════════════════════════════════════════════════════════════
-- §9  Mouse Binds
-- ═══════════════════════════════════════════════════════════════════

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows by dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- ═══════════════════════════════════════════════════════════════════
-- §10  Multimedia Keys
-- ═══════════════════════════════════════════════════════════════════

-- Volume controls (locked + repeating)
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)

-- Brightness controls (locked + repeating)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

-- Special function keys
hl.bind("XF86Search", hl.dsp.exec_cmd("search_launcher.sh"), { locked = true, repeating = true })
hl.bind(
	"XF86Mail",
	hl.dsp.exec_cmd(settings.browser .. " https://mail.google.com/"),
	{ locked = true, repeating = true }
)
hl.bind("XF86HomePage", hl.dsp.exec_cmd(settings.alternate_browser), { locked = true, repeating = true })
hl.bind("XF86Calculator", hl.dsp.exec_cmd("qalculate-gtk"), { locked = true, repeating = true })
hl.bind("XF86Tools", hl.dsp.exec_cmd("spotify"), { locked = true, repeating = true })
-- hl.bind("print", hl.dsp.exec_cmd("flameshot gui"), { locked = true, repeating = true })
hl.bind("print", hl.dsp.exec_cmd("hyprshot -m region"), { locked = true, repeating = true })

-- Media playback controls (locked, not repeating)
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("play_pause.sh"), { locked = true })
hl.bind("pause", hl.dsp.exec_cmd("play_pause.sh"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("play_pause.sh"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("prev_next.sh prev"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("prev_next.sh next"), { locked = true })
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"), { locked = true, repeating = true })
