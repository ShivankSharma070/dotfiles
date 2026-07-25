# ~/.local/bin/vault-sync.sh
rclone sync ~/OneDrive/Obsidian/Vault gdrive:vault \
  --exclude ".*" \
  --exclude ".*/**" \
  --log-file ~/log/rclone-gdrive-obsidian.log \
  -P
