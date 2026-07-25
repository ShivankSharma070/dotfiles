-- ╔══════════════════════════════════════════════════════════════════╗
-- ║                     Settings & Variables                        ║
-- ╚══════════════════════════════════════════════════════════════════╝

local M = {}

-- ── Shared Variables ─────────────────────────────────────────────
-- These are used across modules (keybinds, autostart, etc.)
M.terminal           = "kitty"
M.browser            = "brave"
M.alternate_browser  = "google-chrome-unstable"
M.fileManager        = "nautilus"
M.menu               = "rofi -show drun"

-- ── Environment Variables ────────────────────────────────────────
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("GDK_DISABLE", "gl")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("XDG_MENU_PREFIX", "plasma-")
hl.env("XCURSOR_SIZE", "9")
hl.env("XCURSOR_THEME", "Dot-Dark")
hl.env("XDG_SESSION_TYPE", "wayland")

-- ── Monitor ──────────────────────────────────────────────────────
-- Format: hl.monitor({ output, resolution, position, scale, ... })
hl.monitor({
    output     = "eDP-1",
    mode = "highres@highrr",
    position   = "0x0",
    scale      = 1,
    transform  = 0,
})

-- ── General ──────────────────────────────────────────────────────
hl.config({
    general = {
        gaps_in         = 2,
        gaps_out        = 2,
        border_size     = 1,
        -- Blueish gradient border (solarized-inspired)
        ["col.active_border"]   = "0xee268bd2",
        ["col.inactive_border"] = "rgba(595959aa)",
        resize_on_border = false,
        allow_tearing    = false,
        layout           = "scrolling",
    },
})

-- ── Input ────────────────────────────────────────────────────────
hl.config({
    input = {
        kb_layout     = "us",
        follow_mouse  = 1,
        accel_profile = "adaptive",
        sensitivity   = 0.8,
        touchpad = {
            natural_scroll       = false,
            disable_while_typing = true,
        },
        touchdevice = {
            transform = 0,
        },
    },
})

-- ── Binds Behavior ───────────────────────────────────────────────
hl.config({
    binds = {
        workspace_back_and_forth = false,
        allow_workspace_cycles   = false,
        pass_mouse_when_bound    = false,
    },
})

-- ── XWayland ─────────────────────────────────────────────────────
hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

-- ── Cursor ───────────────────────────────────────────────────────
hl.config({
    cursor = {
        no_hardware_cursors = true,
    },
})

-- ── Decoration ───────────────────────────────────────────────────
hl.config({
    decoration = {
        rounding         = 5,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        dim_inactive     = false,
        dim_strength     = 0.3,
        dim_special      = 0.5,
        shadow = {
            enabled      = false,
            range        = 20,
            render_power = 4,
            color        = "rgba(1a1a1aee)",
        },
        blur = {
            enabled           = true,
            size              = 3,
            passes            = 3,
            noise             = 0,
            ignore_opacity    = true,
            new_optimizations = true,
            vibrancy          = 0.1696,
        },
    },
})

-- ── Master Layout (fallback) ─────────────────────────────────────
hl.config({
    master = {
        new_status = "master",
    },
})

-- ── Misc ─────────────────────────────────────────────────────────
hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
    },
})

-- ── Scrolling Layout ─────────────────────────────────
hl.config({
    scrolling = {
        fullscreen_on_one_column = false,
        focus_fit_method         = 0,
        column_width             = 0.8,
        follow_focus             = true,
        explicit_column_widths   = "0.5, 0.8, 1.0",
    },
})

-- ── Gestures ─────────────────────────────────────────────────────
hl.config({
    gestures = {
        workspace_swipe_cancel_ratio = 0.01,
    },
})

-- ── Hyprgrass Plugin (touch gestures) ────────────────────────────
-- Guard: only configure if the plugin is loaded
if hl.plugin.touch_gestures ~= nil then
    hl.config({
        plugin = {
            touch_gestures = {
                sensitivity                = 3,
                workspace_swipe_fingers    = 3,
                workspace_swipe_edge       = "r",
                long_press_delay           = 300,
                resize_on_border_long_press = true,
                edge_margin                = 50,
                emulate_touchpad_swipe     = false,
            },
        },
    })

    -- Hyprgrass edge swipe binds
    hl.bind(", edge:u:d",  hl.dsp.exec_cmd(M.terminal),     { plugin = "hyprgrass" })
    hl.bind(", edge:r:l",  hl.dsp.exec_cmd(M.fileManager),   { plugin = "hyprgrass" })
    hl.bind(", edge:l:r",  hl.dsp.exec_cmd("obsidian"),      { plugin = "hyprgrass" })
    hl.bind(", edge:d:u",  hl.dsp.exec_cmd("kill -34 $(ps -C wvkbd-mobintl)"), { plugin = "hyprgrass" })

    -- Hyprgrass swipe binds
    hl.bind(", swipe:3:l", hl.dsp.layout("move +col"),       { plugin = "hyprgrass" })
    hl.bind(", swipe:3:r", hl.dsp.layout("move -col"),       { plugin = "hyprgrass" })
    hl.bind(", swipe:4:d", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots"), { plugin = "hyprgrass" })

    -- Hyprgrass long press binds
    hl.bind(", longpress:4", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots"), { plugin = "hyprgrass" })
    hl.bind(", longpress:3", hl.dsp.window.close(),           { plugin = "hyprgrass" })
end

return M
