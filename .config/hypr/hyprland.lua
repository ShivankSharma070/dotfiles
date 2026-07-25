-- ╔══════════════════════════════════════════════════════════════════╗
-- ║                  Hyprland Configuration (Lua)                   ║
-- ║               https://wiki.hypr.land/Configuring/               ║
-- ╚══════════════════════════════════════════════════════════════════╝
--
-- Entry point for Hyprland Lua configuration.
-- Each module is self-contained and handles one concern.
-- Edit individual modules instead of this file.

-- Core settings: env vars, monitor, general, input, decoration, etc.
require("modules.settings")

-- Bezier curves and animation definitions
require("modules.animations")

-- All keybindings: apps, window mgmt, workspaces, media, mouse
require("modules.keybinds")

-- Autostart applications (runs once on session start)
require("modules.autostart")

-- Window rules, layer rules
require("modules.window_rules")
