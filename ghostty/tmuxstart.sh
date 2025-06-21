if command -v tmux >/dev/null 2>&1; then 
  tmux attach || tmux ;
else 
  fish;
fi
