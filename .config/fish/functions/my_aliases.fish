#!/bin/sh fish
# My aliases

function vim -d 'alias vim=nvim'
	command nvim $argv;
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


