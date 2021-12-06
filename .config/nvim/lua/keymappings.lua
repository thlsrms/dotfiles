-- Dvorak remaps
vim.api.nvim_set_keymap("", "h", "<left>", { noremap = true })
vim.api.nvim_set_keymap("", "t", "<down>", { noremap = true })
vim.api.nvim_set_keymap("", "n", "<up>", { noremap = true })
vim.api.nvim_set_keymap("", "s", "<right>", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "n", { noremap = true })
vim.api.nvim_set_keymap("n", "K", "N", { noremap = true })
vim.api.nvim_set_keymap("n", "j", "s", { noremap = true })
vim.api.nvim_set_keymap("n", "J", "S", { noremap = true })
vim.api.nvim_set_keymap("n", "l", "t", { noremap = true })
vim.api.nvim_set_keymap("n", "L", "T", { noremap = true })
vim.api.nvim_set_keymap("", "S", "$", {})
vim.api.nvim_set_keymap("v", "S", "$", { noremap = true })
vim.api.nvim_set_keymap("", "H", "^", {})
vim.api.nvim_set_keymap("", "-", "%", {})

-- Better window movement
vim.api.nvim_set_keymap("n", "<M-s>h", "<C-w>h", { silent = true })
vim.api.nvim_set_keymap("n", "<M-s>t", "<C-w>j", { silent = true })
vim.api.nvim_set_keymap("n", "<M-s>n", "<C-w>k", { silent = true })
vim.api.nvim_set_keymap("n", "<M-s>s", "<C-w>l", { silent = true })

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap("x", "N", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "T", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })

-- Keep visual mode indenting
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Save file by CTRL-S
vim.api.nvim_set_keymap("n", "<M-W>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-W>", "<ESC> :w<CR>", { noremap = true, silent = true })

-- Make word uppercase
-- vim.api.nvim_set_keymap("n", "<M-u>", "viwU<ESC>", { noremap = true })
-- vim.api.nvim_set_keymap("i", "<M-u>", "<ESC>viwUi", { noremap = true })

-- Telescope
vim.api.nvim_set_keymap("n", "<C-p>", "<CMD>Telescope git_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-p>", "<CMD>Telescope live_grep<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-p>", "<CMD>Telescope find_files<CR>", { noremap = true })

-- Remove highlights
vim.api.nvim_set_keymap("n", "<CR>", ":noh<CR><CR>", { noremap = true, silent = true })

-- Find word/file across project
vim.api.nvim_set_keymap("n", "<Leader>pf", "yiw<CMD>Telescope git_files<CR><C-r>+<ESC>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>pw", "<CMD>Telescope grep_string<CR><ESC>", { noremap = true })

-- Git
vim.api.nvim_set_keymap("n", "<Leader>gla", "<CMD>lua require('plugins.telescope').my_git_commits()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>glc", "<CMD>lua require('plugins.telescope').my_git_bcommits()<CR>", { noremap = true, silent = true })

-- Buffers
vim.api.nvim_set_keymap("n", "<Leader>b", "<CMD>Telescope buffers<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Tab>", ":BufferNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gn", ":bn<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferPrevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gp", ":bp<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-q>", ":BufferClose<CR>", { noremap = true, silent = true })

-- Move between barbar buffers
vim.api.nvim_set_keymap("n", "<Space>1", ":BufferGoto 1<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Space>2", ":BufferGoto 2<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Space>3", ":BufferGoto 3<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Space>4", ":BufferGoto 4<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Space>5", ":BufferGoto 5<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Space>6", ":BufferGoto 6<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Space>7", ":BufferGoto 7<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Space>8", ":BufferGoto 8<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Space>9", ":BufferGoto 9<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-1>", ":BufferGoto 1<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-2>", ":BufferGoto 2<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-3>", ":BufferGoto 3<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-4>", ":BufferGoto 4<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-5>", ":BufferGoto 5<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-6>", ":BufferGoto 6<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-7>", ":BufferGoto 7<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-8>", ":BufferGoto 8<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-9>", ":BufferGoto 9<CR>", { silent = true })

-- Don't yank on delete char
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "X", '"_X', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "x", '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "X", '"_X', { noremap = true, silent = true })

-- Avoid issues because of remapping <c-a> and <c-e> below
vim.cmd [[
  nnoremap <Plug>SpeedDatingFallbackUp <c-a>
  nnoremap <Plug>SpeedDatingFallbackDown <c-e>
]]

-- Quickfix
vim.api.nvim_set_keymap("n", "<Space>,", ":cn<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Space>.", ":cn<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<Space>cc", ":cclose<CR>", { silent = true })

-- Easyalign
vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", { silent = true })
vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", { silent = true })

-- Manually invoke speeddating in case switch.vim didn't work
vim.api.nvim_set_keymap("n", "<C-a>", ":if !switch#Switch() <bar> call speeddating#increment(v:count1) <bar> endif<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-e>", ":if !switch#Switch({'reverse': 1}) <bar> call speeddating#increment(-v:count1) <bar> endif<CR>", { noremap = true, silent = true })

-- Space to NOP to prevent Leader issues
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })

-- Open links under cursor in browser with gx
if vim.fn.has('macunix') == 1 then
  vim.api.nvim_set_keymap("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>", { silent = true })
else
  vim.api.nvim_set_keymap("n", "gx", "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", { silent = true })
end

-- Erase painter line
vim.api.nvim_set_keymap("n", "<F4>", "<cmd>lua require('functions').erase_painter_line()<CR>", { noremap = true, silent = true })

-- HopWord
vim.api.nvim_set_keymap("", "<M-h>", "<cmd>HopWord<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<M-h>", "<cmd>HopWord<CR>", { noremap = true, silent = true })
