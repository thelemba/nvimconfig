vim.g.mapleader = ","

local keymap = vim.keymap

keymap.set('n','<leader>e', ':NvimTreeToggle<CR>')

-- telescope
keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
