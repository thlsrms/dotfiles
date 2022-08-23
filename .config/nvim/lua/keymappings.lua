local function bind(op, outer_opts)
  outer_opts = outer_opts or {noremap = true}
  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force",
      outer_opts,
      opts or {}
    )
    vim.keymap.set(op, lhs, rhs, opts)
  end
end

local map = bind("", {noremap = false})
local noremap = bind("")
local noremaps = bind("", {noremap = true, silent = true})
local nmap = bind("n", {noremap = false})
local nmaps = bind("n", {noremap = false, silent = true})
local nnoremap = bind("n")
local nnoremaps = bind("n", {noremap = true, silent = true})
local vnoremap = bind("v")
local vnoremaps = bind("v", {noremap = true, silent = true})
local xnoremap = bind("x")
local xnoremaps = bind("x", {noremap = true, silent = true})
local inoremap = bind("i")
local inoremaps = bind("i", {noremap = true, silent = true})

-- Dvorak remaps
noremap("h", "<left>")
noremap("t", "<down>")
noremap("n", "<up>")
noremap("s", "<right>")
nnoremap("k", "n")
nnoremap("K", "N")
noremap("j", "s")
noremap("J", "S")
noremap("l", "t")
noremap("L", "T")
map("S", "$")
vnoremap("S", "$")
map("H", "^")
map("-", "%")
map("%", "H")
map("^", "L")

nnoremap("ge", "G")
nnoremap("U", "<C-r>")


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

-- Don't yank on delete char
nnoremaps("x", "\"_x")
nnoremaps("X", "\"_X")
vnoremaps("x", "\"_x")
vnoremaps("X", "\"_X")
nnoremaps("d", "\"_d")
vnoremaps("d", "\"_d")
nnoremaps("p", "\"_dP")
vnoremaps("p", "\"_dP")

-- Open links under cursor
if vim.fn.has('macunix') == 1 then
  nmaps("gw", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<cr>")
else
  nmaps("gw", "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<cr>")
end

-- HopWord
noremaps("<M-h>", "<cmd>HopWord<cr>")
vnoremaps("<M-h>", "<cmd>HopWord<cr>")
