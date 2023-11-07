#!/bin/env fish
# remove greeting message
set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
    bind \cg lazygit
    bind \cu fg
end

# Set theme
fish_config theme choose 'ayu Dark'
# source icons-in-terminal icons
source ~/.local/share/icons-in-terminal/icons.fish

# Add to the PATH if directory exists
if test -d ~/.bin
    fish_add_path -gaP ~/.bin
end
if test -d ~/.local/bin
    fish_add_path -gaP ~/.local/bin
end
if test -d ~/.cargo/bin
    fish_add_path -gaP ~/.cargo/bin
end
if test -d ~/go/bin
    fish_add_path -gaP ~/go/bin
end

# Aliases
source $__fish_config_dir/functions/env_vars.fish
source $__fish_config_dir/functions/my_aliases.fish
source $__fish_config_dir/functions/system_maintenance.fish

# emacs vterm support, 'functions/vterm_printf' required
if [ "$INSIDE_EMACS" = 'vterm' ]
    function clear
        vterm_printf "51;Evterm-clear-scrollback";
        tput clear;
    end
end

# Starship theme:
# install "community/x86_64/starship" package before.
starship init fish | source

