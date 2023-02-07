function ckbd -d "Start kmonad by selecting the keyboard to be grabbed by it"
    set -gx KBD_DEVICE (find /dev/input/by-path/*kbd* | fzf)
    set -l KBD_CFG (envsubst < $HOME/.config/kmonad/config.kbd | string split0)

    if count (pgrep -x "kmonad") > /dev/null
        killall kmonad
    end

    echo $KBD_CFG > /tmp/kmonad.cfg
    kmonad /tmp/kmonad.cfg &; disown
end

