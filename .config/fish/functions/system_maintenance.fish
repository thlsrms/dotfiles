#!/bin/sh fish
# System maintenance functions

abbr -g spm sudo pacman
abbr -g pm pacman
abbr -g pms 'pacman -Ss'

# pacman & paru helpers
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
function ripkgs --description "alias rip=expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
    command expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl;
end
function ripkgslong --description "alias rip=expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"
    command expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl;
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

