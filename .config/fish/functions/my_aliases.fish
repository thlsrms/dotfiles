#!/bin/sh fish
# My aliases

function ov -d 'Open neovim and \":cd (directory)\" or open a new buffer if fzf is cancelled'
    if count $argv > /dev/null
        command nvim $argv;
    else
        # Find a directory to open with neovim using fd
        set -l dir (fd . ~/. /zdrive -H -t directory \
            # exclude some of my dirs
            -E "*cache" \
            -E "*.git" \
            -E "*.stack" \
            -E "*node_modules" \
            -E "*target" \
            -E "*.cargo" \
            -E "*go/pkg/mod" \
            -E "*github*" \
            -E "*Games*" \
            -E "*Downloads*" \
        | fzf)
        command nvim $dir/. -c ":cd $dir";
    end
end

function ch -d 'cd into or find and cd if used without arguments'
    if count $argv > /dev/null
        cd $argv;
    else
        set -l dir (fd . -H -t directory | fzf)
        # If fzf is cancelled cd will default to HOME, on wezterm this is my preferred behavior
        # since I can ALT+direction to go back to the previous directory.
        cd $dir;
    end
end

function rg -d 'alias rg=rg --sort path'
	command rg --sort path $argv;
end

function fehrandom -d 'alias fehrandom=feh --randomize --bg-max'
	command feh --randomize ~/Pictures/Wallpapers/* --bg-max;
end

function zz -d "Z jump to /zdrive"
	z zdrive;
end

function rmgitcache -d 'alias rmgitcache=rm -r $HOME/.cache/git'
	command rm -r $HOME/.cache/git;
end

# Dotfiles bare repo
abbr -g .f dotfiles
function dotfiles --description 'alias dotfiles=/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
     command /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv; 
end
abbr -g .lf lzdotfiles
function lzdotfiles --description 'alias lzdotfiles=lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
     command lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv; 
end

# exa extros
function llait -d 'alias llait=llai --tree --level'
	llai --tree --level $argv;
end

function llit -d 'alias llit=lli --tree --level'
	lli --tree --level $argv;
end


