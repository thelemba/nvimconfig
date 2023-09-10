require('luasnip.loaders.from_vscode').load()
local cmp = require'cmp'

vim.opt.completeopt = 'menu,menuone,noselect'
local snip = require 'luasnip'

snip.config.set_config{
  history = true,
  updateevents = "TextChanged,TextChangedI",
  
  enable_autosnippets = true,
}

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


cmp.setup({
 
  snippet = {
    expand = function(args)
      snip.lsp_expand(args.body)
    end,
  },

  sources = cmp.config.sources({
  { name = 'nvim_lsp_signature_help' },
  { name = 'nvim_lua'},
  { name = 'nvim_lsp'},
	{ name = 'luasnip'},
	{ name = 'buffer'},
	{ name = 'path'},
  }),

  window = {
    documentation = cmp.config.window.bordered()
  },

  experimental = {
    native_menu = false,
    ghost_text = true,
  },


mapping = {

    -- ... Your other mappings ...

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
      -- they way you will only jump inside the snippet region
      elseif snip.expand_or_jumpable() then
        snip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif snip.jumpable(-1) then
        snip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    -- ... Your other mappings ...
    ['<CR>'] = cmp.mapping.confirm { select = true },
  },

})
