
#!/usr/bin/env sh

ghostyrunning=$(pgrep -x "ghostty")
if command -v tmux >/dev/null 2>&1; then 
  if  [[ -z $ghostyrunning ]] then
    ghostty -e "tmux attach || tmux";
  else
    ghostty -e "tmux";
fi
else 
  fish;
fi
