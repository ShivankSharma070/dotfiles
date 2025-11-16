function fish
        emacsclient -c $argv || (/usr/bin/eamcs --daemon &; emacsclient -c $argv)
end
