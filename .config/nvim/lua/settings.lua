local options = {
    clipboard = "unnamed,unnamedplus",
    cmdheight = 1,
    completeopt = "menu,menuone,noselect",
    cursorline = true,
    expandtab = true,
    ignorecase = true,
    smartcase = true,
    lazyredraw = true,
    mouse = "a",
    showtabline = 0,
    signcolumn = "yes",
    number = true,
    relativenumber = true,
    scrolloff = 8,
    shiftwidth = 4,
    softtabstop = 4,
    tabstop = 4,
    autoindent = true,
    smartindent = true,
    smarttab = true,
    splitright = true,
    swapfile = false,
    undofile = true,
    termguicolors = true,
    timeoutlen = 300,
    ttimeoutlen = 100,
    updatetime = 100,
    viminfo = "'1000",
    wildignore = "*node_modules/**",
    wrap = false,
    writebackup = false,
    backspace = "indent,eol,start",
    backup = false,
    conceallevel = 0,
    encoding = "utf-8",
    fileencoding = "utf-8",
    errorbells = false,
    incsearch = true,
    hlsearch = true,
    showmode = true,
    guicursor = "",
    undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir",
    colorcolumn = "103",
    pumblend = 25,
}

local globals = {
    mapleader = " ",
    loaded_netrw = 1,
    loaded_netrwPlugin = 1,
}

vim.opt.shortmess:append('c')
vim.opt.shortmess:append('F')
vim.opt.formatoptions:remove('c')
vim.opt.formatoptions:remove('r')
vim.opt.formatoptions:remove('o')

for k, v in pairs(options) do
    vim.opt[k] = v
end

for k, v in pairs(globals) do
    vim.g[k] = v
end
