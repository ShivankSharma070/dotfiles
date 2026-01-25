# dirName=~/.config/neofetch/normal/remfetch/pokemon/
# fileName=$(ls $dirName | shuf -n 1 | awk '{print $NF}' )
# if ! [ -z $1 ]; then
#     fileName=$1
# fi

# neofetch --source $dirName$fileName

kittyrunning=$(pgrep -x "kitty")
if command -v tmux >/dev/null 2>&1; then 
  if  [[ -z $kittyrunning ]] then
   kitty  sh -c "tmux attach || tmux";
  else
   kitty tmux;
fi
else 
  fish;
fi
