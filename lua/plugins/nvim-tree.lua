vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup(
{
  renderer = {
    group_empty = true,
  },
  open_on_tab = false,
  filters = {
    custom = {'.meta'}
  },

  view = {
    hide_root_folder = false,
    side = 'left',
    number = false
  }
})
