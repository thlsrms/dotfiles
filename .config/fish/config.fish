#!/bin/sh fish
# remove greeting message
set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Set theme
fish_config theme choose 'ayu Dark'
# source icons-in-terminal icons
source ~/.local/share/icons-in-terminal/icons.fish

# Env vars
set -gx EDITOR 'hx'
set -gx VISUAL 'nvim'

set -gx AMD_VULKAN_ICD 'RADV'
set -gx CHROME_EXECUTABLE 'brave'

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

# Aliases
source $__fish_config_dir/functions/my_aliases.fish
source $__fish_config_dir/functions/system_maintenance.fish

# Extractor function: ex.fish

# Starship theme:
# install "community/x86_64/starship" package before.
starship init fish | source


