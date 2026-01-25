#!/usr/bin/env python
import os
import random
import shutil
import subprocess
import time
import tkinter as tk
from datetime import datetime

import cv2


class FakeLock:
    def __init__(self, root, password="mysecret"):
        self.root = root
        self.password = password
        self.config_dir = os.path.expanduser("~/.config/hypr/configs/")
        self.keybinds_file = os.path.join(self.config_dir, "keybinds.conf")
        self.backup_file = os.path.join(self.config_dir, "keybinds.conf.bak")
        self.onedrive_dir = os.path.expanduser("~/OneDrive/Intruders/")
        self.blink_state = True
        self.first_failed_attempt = False

        # Ensure Dropbox directory exists
        os.makedirs(self.onedrive_dir, exist_ok=True)

        # Set window title for Hyprland
        self.root.title("Fake-Lock-Screen")
        self.root.wm_attributes("-type", "dialog")

        # Disable Hyprland keybindings
        self.disable_hyprland_keybindings()

        # Configure window
        self.root.attributes("-fullscreen", True)
        self.root.configure(bg="black")
        self.root.attributes("-topmost", True)

        # Create UI
        self.setup_ui()

        # Bind key events
        self.root.bind("<Return>", self.handle_enter)
        self.root.bind("<BackSpace>", self.handle_backspace)

        # Start animations
        self.animate_blink()
        self.animate_data_stream()

    def setup_ui(self):
        # Warning text
        self.warning_text_default = (
            "WARNING: UNAUTHORIZED ACCESS DETECTED!\n"
            "This system is protected by advanced security protocols.\n"
            "Enter the correct password or face immediate lockdown.\n"
            "All activity is being logged."
        )
        self.warning_label = tk.Label(
            self.root,
            text=self.warning_text_default,
            fg="#00ff00",
            bg="black",
            font=("Courier", 24, "bold"),
            justify="center",
        )
        self.warning_label.place(relx=0.5, rely=0.3, anchor="center")

        # Input field (terminal style)
        self.entry_frame = tk.Frame(self.root, bg="black")
        self.entry_frame.place(relx=0.5, rely=0.5, anchor="center")

        self.prompt_label = tk.Label(
            self.entry_frame,
            text="root@system:~$ ",
            fg="#00ff00",
            bg="black",
            font=("Courier", 18),
        )
        self.prompt_label.pack(side="left")

        self.entry = tk.Entry(
            self.entry_frame,
            fg="#00ff00",
            bg="#1a1a1a",
            insertbackground="#00ff00",
            font=("Courier", 18),
            width=20,
            show="*",
            relief="flat",
            highlightthickness=2,
            highlightcolor="#00ff00",
            highlightbackground="#00ff00",
        )
        self.entry.pack(side="left")
        self.entry.focus_set()

        # Data stream background
        self.data_stream_label = tk.Label(
            self.root,
            text="",
            fg="#003300",  # Dark green
            bg="black",
            font=("Courier", 12),
            justify="left",
            wraplength=800,
        )
        self.data_stream_label.place(relx=0.5, rely=0.9, anchor="center")

    def disable_hyprland_keybindings(self):
        try:
            if os.path.exists(self.keybinds_file):
                shutil.copy(self.keybinds_file, self.backup_file)
            with open(self.keybinds_file, "w") as f:
                f.write("")
            subprocess.run(["hyprctl", "reload"], check=False)
        except Exception as e:
            print(f"Error disabling keybindings: {e}")

    def restore_hyprland_keybindings(self):
        try:
            if os.path.exists(self.backup_file):
                shutil.copy(self.backup_file, self.keybinds_file)
            subprocess.run(["hyprctl", "reload"], check=False)
        except Exception as e:
            print(f"Error restoring keybindings: {e}")

    def capture_photo(self):
        try:
            # Open webcam (index 0, adjust if needed)
            cap = cv2.VideoCapture(0)
            if cap.isOpened():
                # Update warning text
                self.warning_label.config(text="INTRUDER PHOTOGRAPHED! ACCESS DENIED!")

                time.sleep(1)
                # Capture one frame
                ret, frame = cap.read()
                if ret:
                    # Generate timestamped filename
                    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
                    filename = os.path.join(
                        self.onedrive_dir, f"intruder_{timestamp}.jpg"
                    )

                    # Save photo
                    cv2.imwrite(filename, frame)
                    print(f"Photo saved to {filename}")

                # Release webcam
                cap.release()

                # Restore default warning text after 2 seconds
                self.root.after(
                    2000,
                    lambda: self.warning_label.config(text=self.warning_text_default),
                )
            else:
                print("Webcam not accessible")
        except Exception as e:
            print(f"Error capturing photo: {e}")

    def handle_enter(self, event):
        input_text = self.entry.get()
        if input_text == self.password:
            self.restore_hyprland_keybindings()
            self.root.quit()
            subprocess.run(["stop-activity-detection.sh"], check=False)
        else:
            self.entry.delete(0, tk.END)
            if not self.first_failed_attempt:
                self.first_failed_attempt = True
                self.capture_photo()
            else:
                self.warning_label.config(
                    text="ACCESS DENIED! SYSTEM LOCKDOWN IMMINENT!"
                )
                self.root.after(
                    2000,
                    lambda: self.warning_label.config(text=self.warning_text_default),
                )

    def handle_backspace(self, event):
        # Backspace handled by Entry widget
        pass

    def animate_blink(self):
        # Toggle warning text color for flicker effect
        self.blink_state = not self.blink_state
        color = "#00ff00" if self.blink_state else "#006600"
        self.warning_label.config(fg=color)
        self.root.after(500, self.animate_blink)

    def animate_data_stream(self):
        # Generate random binary/hex data
        data = "".join(random.choice("01ABCDEF") for _ in range(200))
        self.data_stream_label.config(
            text="\n".join([data[i : i + 40] for i in range(0, len(data), 40)])
        )
        self.root.after(500, self.animate_data_stream)

    def run(self):
        try:
            self.root.mainloop()
        finally:
            self.restore_hyprland_keybindings()


if __name__ == "__main__":
    root = tk.Tk()
    app = FakeLock(root, password="khulja")  # Change to your desired password
    app.run()
