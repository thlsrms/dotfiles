-- For the first run the order should be:
-- -- require('config')
-- -- require('plugins')
-- after installing the initial packages
-- with :PackerSync
-- and installing pynvim 'pip3 install pynvim'
-- the below order should be used
require('impatient') -- This needs to be first
require('config')
require('plugins')
require('settings')
require('colorscheme')
require('keymappings')
require('autocmds')
require('functions')
require('lsp.config')
