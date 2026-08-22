-- ╔══════════════════════════════════════════════════════════════════╗
-- ║                      Autostart Programs                         ║
-- ╚══════════════════════════════════════════════════════════════════╝
--
-- These run once when Hyprland starts (equivalent to exec-once).
-- hl.exec_cmd() spawns async processes — no need for & or disown.

hl.on("hyprland.start", function()
	hl.exec_cmd("awww-daemon")
	-- hl.exec_cmd("hyprpm reload -n")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("waybar")
	hl.exec_cmd("connectwifi.sh")
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("blueman-applet")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("runWorkspaceIndicator.sh hypr")
	hl.exec_cmd("kdeconnectd")
	hl.exec_cmd("nwg-wrapper-todo.sh")
end)
