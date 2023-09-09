require('luasnip.loaders.from_vscode').lazy_load()
local cmp = require'cmp'

vim.opt.completeopt = 'menu,menuone,noselect'

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  sources = cmp.config.sources({
	{ name = 'luasnip'},
	{ name = 'buffer'},
	{ name = 'path'},
  }),
})
