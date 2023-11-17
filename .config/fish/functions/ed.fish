#!/usr/bin/env fish
# ed - but not the typical ed text editor

function ed -d 'Open $VISUAL at the selected directory or open a new buffer if fzf is cancelled'
    if count $argv > /dev/null
        if [ $VISUAL = nvim ]
            command $VISUAL $argv -c ":lcd %:p:h"
        else
            command $VISUAL $argv
        end
    else
        # Find a directory to open with the editor using fd
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
            -E "*repos*" \
            -E "*Games*" \
            -E "*Downloads*" \
        | fzf)

        # Neovim needs the -c flag
        if [ $VISUAL = nvim ]
            command $VISUAL -c ":cd $dir" -c "lua require('dashboard'):instance()"
        else
            command $VISUAL $dir/.
        end
    end
end
