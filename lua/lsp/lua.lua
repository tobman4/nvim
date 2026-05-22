local luals = os.getenv("LUA_LSP_PATH") or vim.fn.exepath("lua-language-server")
if luals == "" then
  vim.notify("lua-language-server not found (set $LUA_LSP_PATH or add to PATH)", vim.log.levels.ERROR)
  return
end

vim.lsp.config.luals = {
  cmd = { luals },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
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

vim.lsp.enable("luals")
