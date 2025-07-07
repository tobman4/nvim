
vim.lsp.enable("luals")
vim.lsp.config['luals'] = {
  cmd = { '/home/tl/lsp/lua/bin/lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
}


