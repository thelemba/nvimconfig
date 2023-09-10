require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {'lua_ls'}
})
local cmp_nvim_lsp = require'cmp_nvim_lsp'
local capabilities = cmp_nvim_lsp.default_capabilities()
local on_attach = function(client,bufnr)
  local bufopts = {noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
     
end

require('lspconfig').lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'}
      }
    }
  }
}
require('lspconfig').omnisharp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = {
    ['textDocument/definition'] = require('omnisharp_extended').handler,
  
  },
  cmd = { 'omnisharp','--languageserver','--hostPID',tostring(vim.fn.getpid())},
}

