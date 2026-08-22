-- ╔══════════════════════════════════════════════════════════════════╗
-- ║                         Animations                              ║
-- ╚══════════════════════════════════════════════════════════════════╝

-- Enable animations globally
hl.config({
    animations = {
        enabled = true,
    },
})

-- ── Bezier Curves ────────────────────────────────────────────────
-- curve(name, { type, points = { {x1,y1}, {x2,y2} } })
hl.curve("open",     { type = "bezier", points = { {0.2, 1.0}, {0.4, 1.0} } })
hl.curve("close",    { type = "bezier", points = { {0.4, 0.0}, {0.8, 0.6} } })
hl.curve("momentum", { type = "bezier", points = { {0.0, 0.9}, {0.15, 1.0} } })
hl.curve("linout",   { type = "bezier", points = { {0.0, 1.0}, {0.0, 1.0} } })

-- ── Animation Definitions ───────────────────────────────────────
-- animation({ leaf, enabled, speed, bezier, style? })

-- Window open: popin effect at 93% scale
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 2, bezier = "open",  style = "popin 93%" })

-- Window close: popin effect at 96% scale
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 1, bezier = "close", style = "popin 96%" })

-- Window movement: slide transition
hl.animation({ leaf = "windowsMove", enabled = true, speed = 2, bezier = "open",  style = "slide" })

-- Workspace switch: vertical slide with momentum
hl.animation({ leaf = "workspaces",  enabled = true, speed = 3, bezier = "momentum", style = "slidevert" })

-- Fade effect for focus transitions
hl.animation({ leaf = "fade",        enabled = true, speed = 2, bezier = "open" })

-- Border color transition
hl.animation({ leaf = "border",      enabled = true, speed = 8, bezier = "linout" })

-- Border angle animation (gradient rotation loop)
hl.animation({ leaf = "borderangle", enabled = true, speed = 60, bezier = "linout", style = "loop" })
