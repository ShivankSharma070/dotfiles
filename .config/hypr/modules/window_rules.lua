-- ╔══════════════════════════════════════════════════════════════════╗
-- ║                  Window Rules & Layer Rules                     ║
-- ╚══════════════════════════════════════════════════════════════════╝

-- ── Fullscreen Idle Inhibit ──────────────────────────────────────
hl.window_rule({
    match         = { fullscreen = 1 },
    idle_inhibit  = "fullscreen",
    opacity       = 1,
})

-- ── Picture-in-Picture ───────────────────────────────────────────
hl.window_rule({
    match   = { title = "^(Picture-in-Picture)$" },
    opacity = 1,
    pin     = true,
    float   = true,
    size    = { "monitor_w*0.25", "monitor_h*0.25" },
    move    = { "monitor_w*0.72", "monitor_h*0.07" },
})

-- ── Global Opacity ───────────────────────────────────────────────
hl.window_rule({ match = { class = ".*" },       opacity = 0.96 })

-- ── App-specific Opacity Overrides ───────────────────────────────
hl.window_rule({ match = { class = "vlc" },                opacity = 1 })
hl.window_rule({ match = { class = "mpv" },                opacity = 1 })
hl.window_rule({ match = { class = "org.kde.okular" },     opacity = 1 })
hl.window_rule({ match = { class = "com.obsproject.Studio" }, opacity = 1 })
hl.window_rule({ match = { class = "com.mitchellh.ghostty" }, opacity = 1 })
hl.window_rule({ match = { class = "kitty" },              opacity = 1 })
hl.window_rule({ match = { class = "foot" },               opacity = 1 })
hl.window_rule({ match = { title = "Fake-Lock-Screen" },   opacity = 1 })
hl.window_rule({ match = { title = "^(.*YouTube.*)$" },    opacity = 1 })

-- Neovide: slightly transparent
hl.window_rule({ match = { class = "neovide" }, opacity = 0.95 })

-- ── Floating Rules ───────────────────────────────────────────────
hl.window_rule({ match = { class = "org.gnome.Calendar" }, float = true })
hl.window_rule({ match = { class = "org.gnome.clocks" },   float = true })
hl.window_rule({ match = { title = "Qalculate!" },         float = true })
hl.window_rule({ match = { class = "Electron" },           float = true })

-- Conky: floating, no border
hl.window_rule({
    match       = { class = "(?i)conky" },
    float       = true,
    border_size = 0,
})

-- TastyTrade floating windows
hl.window_rule({
    match = { class = "^(tasty.javafx.launcher.LauncherFxApp)$", title = "^(tastytrade)$" },
    float = true,
})
hl.window_rule({
    match = { class = "^(tasty.javafx.launcher.LauncherFxApp)$", title = "^(tastycharts)$" },
    float = true,
})
hl.window_rule({
    match = { class = "^(tasty.javafx.launcher.LauncherFxApp)$", title = "^(tastytrade - Portfolio Report)$" },
    float = true,
})
hl.window_rule({
    match = { class = "^(tasty.javafx.launcher.LauncherFxApp)$", title = "^(Dashboard)$" },
    float = true,
})

-- ── XWayland Focus Fix ───────────────────────────────────────────
hl.window_rule({
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-- ── Layer Rules (blur) ───────────────────────────────────────────

-- Waybar: full blur
hl.layer_rule({
    match        = { namespace = "waybar" },
    blur         = true,
    ignore_alpha = 0,
})

-- SwayNC: glassmorphic blur (low alpha threshold for frosted-glass effect)
hl.layer_rule({
    match        = { namespace = "swaync-control-center" },
    blur         = true,
    ignore_alpha = 0.3,
})
hl.layer_rule({
    match        = { namespace = "swaync-notification-window" },
    blur         = true,
    ignore_alpha = 0.3,
})
