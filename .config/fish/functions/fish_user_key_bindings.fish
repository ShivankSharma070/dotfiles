function __ctrl_c
    echo ""
    commandline ""
    commandline -f repaint
end
function fish_user_key_bindings
    fish_vi_key_bindings

    bind \cd ''

    bind -M insert ctrl-c __ctrl_c
    bind -M default ctrl-c __ctrl_c
    bind -M visual ctrl-c __ctrl_c
    # bind -M insert ctrl-c cancel-commandline
    # bind -M default ctrl-c cancel-commandline
    # bind -M visual ctrl-c cancel-commandline
    bind -M insert jk 'set fish_bind_mode default; commandline -f repaint'
end
