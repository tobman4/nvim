
vim.lsp.enable("luals")
vim.lsp.config['luals'] = {
  cmd = { '/home/tl/lsp/lua/bin/lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
	settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			}
		}
	}
}


