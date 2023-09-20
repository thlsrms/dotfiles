#!/usr/bin/env fish
# ed - but not the typical ed text editor

function ed -d 'Open $VISUAL at the selected directory or open a new buffer if fzf is cancelled'
    if count $argv > /dev/null
        command $VISUAL $argv;
    else
        # Find a directory to open with neovim using fd
        set -l dir (fd . ~/.config ~/Documents /zdrive -H -t directory \
            # exclude some of my dirs
            -E "*cache" \
            -E "*.git" \
            -E "*.stack" \
            -E "*node_modules" \
            -E "*target" \
            -E "*.cargo" \
            -E "*opam" \
            -E "*go/pkg/mod" \
            -E "*github*" \
            -E "*Games*" \
            -E "*Downloads*" \
        | fzf)

        # Neovim needs the -c flag
        if [ $VISUAL = "nvim" ]
            command $VISUAL $dir/. -c ":cd $dir" -c ":Telescope find_files";
        else
            command $VISUAL $dir/.;
        end
    end
end
