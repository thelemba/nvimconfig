vim.g.mapleader = ","

local keymap = vim.keymap
local snip = require 'luasnip'
keymap.set('n','<leader>e', ':NvimTreeToggle<CR>')

-- telescope
keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
-- snippet

