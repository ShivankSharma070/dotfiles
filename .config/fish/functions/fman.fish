# Find man page of any command
function fman
          complete -C | awk '{print $1}' | fzf | xargs man
end

