function nvf -d "Push a file to the Neovim headless server using FULL path"
    if test (count $argv) -eq 0
        return
    end

    command nvim --server /tmp/nvimsocket.sock --remote-tab $argv
end
