#!/bin/sh fish
# remove greeting message
set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
    bind \cs ch
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
# Source xprofile
source ~/.xprofile

# Aliases
source $__fish_config_dir/functions/env_vars.fish
source $__fish_config_dir/functions/my_aliases.fish
source $__fish_config_dir/functions/system_maintenance.fish

# Extractor function: ex.fish

# Starship theme:
# install "community/x86_64/starship" package before.
starship init fish | source

