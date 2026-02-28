#!/usr/bin/env python
import gi
import json
import subprocess

gi.require_version("Gtk", "4.0")
gi.require_version("Gtk4LayerShell", "1.0")

from gi.repository import Gtk, Gdk, GLib, Gtk4LayerShell


class WorkspaceIndicator(Gtk.Application):
    def __init__(self):
        super().__init__(application_id="com.sd.workspaceindicator")
        self.window = None

    def do_activate(self):
        if not self.window:
            self.window = Gtk.ApplicationWindow(application=self)

            # --- LAYER SHELL SETUP ---
            Gtk4LayerShell.init_for_window(self.window)
            Gtk4LayerShell.set_layer(
                self.window,
                Gtk4LayerShell.Layer.OVERLAY
            )

            Gtk4LayerShell.set_anchor(
                self.window,
                Gtk4LayerShell.Edge.BOTTOM,
                True
            )
            Gtk4LayerShell.set_anchor(
                self.window,
                Gtk4LayerShell.Edge.RIGHT,
                True
            )

            Gtk4LayerShell.set_margin(
                self.window,
                Gtk4LayerShell.Edge.BOTTOM,
                5
            )
            Gtk4LayerShell.set_margin(
                self.window,
                Gtk4LayerShell.Edge.RIGHT,
                5
            )

            # Optional but recommended for indicators
            Gtk4LayerShell.set_keyboard_mode(
                self.window,
                Gtk4LayerShell.KeyboardMode.NONE
            )

            # --- WINDOW PROPERTIES ---
            self.window.set_title("WorkspaceIndicator")
            self.window.set_decorated(False)
            self.window.set_default_size(30, 25)
            self.window.set_resizable(False)
            self.window.set_focusable(False)

            # --- LABEL ---
            self.label = Gtk.Label(label="")
            self.window.set_child(self.label)

            # --- CSS ---
            css_provider = Gtk.CssProvider()
            css_provider.load_from_data(b"""
                window {
                    background-color: black;
                    color: white;
                    font-size: 12px;
                }
            """)
            Gtk.StyleContext.add_provider_for_display(
                Gdk.Display.get_default(),
                css_provider,
                Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
            )

            # --- UPDATE LOOP ---
            GLib.timeout_add(300, self.update_workspace)

        self.window.present()

    def update_workspace(self):
        try:
            output = subprocess.check_output(["mmsg", "-gt"]).decode()

            for line in output.splitlines():
                parts = line.split()

                # Expected format:
                # eDP-1 tag <num> <selected> <clients> <urgent>
                if len(parts) >= 6 and parts[1] == "tag":
                    tag_num = int(parts[2])
                    is_selected = parts[3] == "1"

                    if is_selected:
                        self.label.set_text(str(tag_num))
                        break

        except Exception as e:
            print(f"Error: {e}")

        return True


def main():
    app = WorkspaceIndicator()
    app.run()


if __name__ == "__main__":
    main()

