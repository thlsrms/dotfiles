function nvr -d "Push a file to the Neovim headless server using RELATIVE path"
    if test (count $argv) -eq 0
        return
    end

    command nvim --server /tmp/nvimsocket.sock --remote-tab $PWD/$argv
end
