if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Set theme
fish_config theme choose 'ayu Dark'

set -gx EDITOR 'nvim'
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

# Aliases ------------------------------!
function vim --description 'alias vim=nvim'
    command nvim $argv; 
end
function hx --description 'alias hx=helix'
    command helix $argv; 
end
function zj --description 'alias zj=zellij'
    command zellij $argv; 
end

function rg --description 'alias rg=rg --sort path'
    command rg --sort path $argv;
end

function rmgitcache -d "alias rmgitcache=rm -r $HOME/.cache/git"
    command rm -r $HOME/.cache/git;
end

function fix-permissions --description 'alias fix-permissions=sudo chown -R $USER:$USER ~/.config ~/.local'
    command sudo chown -R $USER:$USER ~/.config ~/.local;
end

# pacman & paru helpers
function pacman --description 'alias pacman=sudo pacman'
    command sudo pacman $argv; 
end
function update --description 'alias update=sudo pacman -Syyu'
    command sudo pacman -Syyu; 
end
function unlockpacman --description 'alias unlockpacman=sudo rm /var/lib/pacman/db.lck'
    command sudo rm /var/lib/pacman/db.lck; 
end
function upall --description 'alias upall=paru -Syu --noconfirm'
    command paru -Syu --noconfirm; 
end
# cleanup orphaned packages
function cleanup --description 'alias cleanup=sudo pacman -Rns $(pacman -Qtdq)'
    command sudo pacman -Rns $(pacman -Qtdq); 
end
# recent installed packages
function rip --description 'alias rip=expac --timefmt=\'%Y-%m-%d %T\' \'%l\t%n %v\' | sort | tail -200 | nl'
    command expac --timefmt=\'%Y-%m-%d %T\' \'%l\t%n %v\' | sort | tail -200 | nl;
end
function riplong --description 'alias rip=expac --timefmt=\'%Y-%m-%d %T\' \'%l\t%n %v\' | sort | tail -3000 | nl'
    command expac --timefmt=\'%Y-%m-%d %T\' \'%l\t%n %v\' | sort | tail -3000 | nl;
end
function big --description "alias big=expac -H M '%m\t%n' | sort -h | nl"
    command expac -H M '%m\t%n' | sort -h | nl; 
end

# get error messages from journalctl
function jctl --description 'alias jctl=journalctl -p 3 -xb'
    command journalctl -p 3 -xb; 
end
function sysfailed --description 'alias sysfailed=systemctl list-units --failed'
    command systemctl list-units --failed;
end

# Dotfiles bare repo
function config --description 'alias config=/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
     command /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv; 
end

# # usage: ex <file>
function ex -d "Extractor for all kinds of archives"
    if count $argv > /dev/null
        switch $argv[1]
            case '*'.tar
                tar xf $argv[1];
            case '*'.tar.xz
                tar xf $argv[1];
            case '*'.tar.zst
                tar xf $argv[1];
            case '*'.tar.bz2
                tar xjf $argv[1];
            case '*'.tbz2
                tar xjf $argv[1];
            case '*'.tar.gz
                tar xzf $argv[1];
            case '*'.tgz
                tar xzf $argv[1];
            case '*'.bz2
                bunzip2 $argv[1];
            case '*'.gz
                gunzip $argv[1];
            case '*'.rar
                unrar x $argv[1];
            case '*'.zip
                unzip $argv[1];
            case '*'.Z
                uncompress $argv[1];
            case '*'.7z
                7z x $argv[1];
            case '*'.deb
                ar x $argv[1];
            case '*'
                echo "'$argv[1]' cannot be extracted via ex";
        end
    else
        echo "'$argv[1]' is not a valid file"
    end
end



# Alias fn
#function *ALIAS* --description 'alias *ALIAS*=*COMMAND*'
# command *COMMAND* $argv; 
#end

# Starship theme:
# install 'curl -sS https://starship.rs/install.sh | sh' before.
starship init fish | source