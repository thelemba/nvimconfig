local action = require('telescope.actions')

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ['C-k>'] = action.move_selection_previous,
        ['C-j>'] = action.move_selection_next
      }
    }
  }
}
