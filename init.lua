require('pluginsetup')
require('plugins.nvim-tree')
require('plugins.telescope')
require('plugins.lualine')
require('plugins.treesitter')
require('plugins.autocompletion')
require('plugins.lspconfig')
require('options')
require('keymaps')

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

