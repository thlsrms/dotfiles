local function bind(op, outer_opts)
    outer_opts = outer_opts or { noremap = true }
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

local map = bind("", { noremap = false })
local noremaps = bind("", { noremap = true, silent = true })
local nmaps = bind("n", { noremap = false, silent = true })
local nnoremap = bind("n")
local nnoremaps = bind("n", { noremap = true, silent = true })
local vnoremaps = bind("v", { noremap = true, silent = true })
local xnoremaps = bind("x", { noremap = true, silent = true })
local inoremaps = bind("i", { noremap = true, silent = true })

map("H", "^")
map("-", "%")

nnoremap("ge", "G")
nnoremap("U", "<C-r>")
-- Reverse mark motions between backtick and single quote
nnoremap("'", "`")
nnoremap("`", "'")

-- Center on C-u/d
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")


-- Move selected line / block of text in visual mode
xnoremaps("<C-n>", ":move '<-2<cr>gv-gv")
xnoremaps("<C-t>", ":move '>+1<cr>gv-gv")

-- Keep visual mode indenting
vnoremaps("<", "<gv")
vnoremaps(">", ">gv")

-- Save with Alt-W
nnoremaps("<M-W>", ":w<cr>")
inoremaps("<M-W>", "<esc> :w<cr>")

-- Remove highlight
--nnoremap("<esc>", "<NOP>")
nnoremaps("<esc>", ":noh<cr>")

-- Open links under cursor
if vim.fn.has('macunix') == 1 then
    nmaps("gw", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<cr>")
else
    nmaps("gw", "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<cr>")
end
