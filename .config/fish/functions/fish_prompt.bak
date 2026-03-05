function fish_prompt
    # Arrow at start (Accent Cyan)
    set_color "#7dcfff"
    echo -n "➜ "

    # Directory name (Accent Yellow)
    set_color --bold "#c0caf5"
    echo -n (basename (pwd))
    set_color normal

    # Default: empty branch and not in git
    set branch ""
    set in_git_repo 0

    # Check if inside a git repo
    if git rev-parse --is-inside-work-tree 2>/dev/null | grep -q "true"
        set in_git_repo 1
        set branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)
    end

    # git:(branch)
    set_color  "#7aa2f7"
    echo -n " git:("
    if test $in_git_repo -eq 1
        set_color  "#bb9af7"
        echo -n $branch
    else 
        set_color  --bold "#bb9af7"
        echo -n "╭∩╮(•̀_·́)╭∩╮"
        set_color normal 
    end
    set_color  "#7aa2f7"
    echo -n ") "
    set_color normal

    # Enhanced git status
    if test $in_git_repo -eq 1
        set git_status (git status --porcelain 2>/dev/null)
        set git_staged ""
        set git_modified ""
        set git_untracked ""
        set git_deleted ""
        set git_renamed ""

        # Parse git status output
        for line in $git_status
            set status_code (string sub -l 2 $line)

            # Check first character (staged/index status)
            switch (string sub -l 1 $status_code)
                case "A"
                    set git_staged "+"  # Added to index
                case "M"
                    set git_staged "±"  # Modified in index
                case "D"
                    set git_staged "-"  # Deleted from index
                case "R"
                    set git_renamed "»" # Renamed
                case "C"
                    set git_staged "©"  # Copied
            end

            # Check second character (working tree status)
            switch (string sub -s 2 -l 1 $status_code)
                case "M"
                    set git_modified "✘"  # Modified in working tree
                case "D"
                    set git_deleted "✘"   # Deleted in working tree
                case "?"
                    set git_untracked "✘" # Untracked files
            end
        end

        # Check for ahead/behind commits
        set ahead_behind (git rev-list --left-right --count HEAD...@{upstream} 2>/dev/null)
        set ahead ""
        set behind ""
        if test -n "$ahead_behind"
            set counts (string split \t $ahead_behind)
            if test $counts[1] -gt 0
                set ahead "⇡$counts[1]"
            end
            if test $counts[2] -gt 0
                set behind "⇣$counts[2]"
            end
        end

        # Check if there are stashed changes
        set stashed ""
        if git rev-parse --verify refs/stash >/dev/null 2>&1
            set stashed "\$"
        end

        # Display single status indicator (priority order)
        if test -z "$git_status" -a -z "$ahead" -a -z "$behind" -a -z "$stashed"
            # Clean repo (Bright Green)
            set_color --bold "#9ece6a"
            echo -n ""
        else if test -n "$git_untracked"
            # Untracked files (Red)
            set_color "#f7768e"
            echo -n "✘ "
        else if test -n "$git_modified"
            # Modified files (Red)
            set_color "#f7768e"
            echo -n "✘ "
        else if test -n "$git_deleted"
            # Deleted files (Red)
            set_color "#f7768e"
            echo -n "✘ "
        else if test -n "$git_staged"
            # Staged changes (Blue)
            set_color "#7aa2f7"
            echo -n "✘ "
        else if test -n "$git_renamed"
            # Renamed files (Orange)
            set_color "#ff9e64"
            echo -n "» "
        else if test -n "$ahead"
            # Ahead commits (Cyan)
            set_color "#7dcfff"
            echo -n "⇡ "
        else if test -n "$behind"
            # Behind commits (Yellow)
            set_color "#e0af68"
            echo -n "⇣ "
        else if test -n "$stashed"
            # Stashed changes (Purple)
            set_color "#bb9af7"
            echo -n "\$ "
        else
            # Fallback - something changed but not sure what
            set_color "#f7768e"
        end
    end

end

