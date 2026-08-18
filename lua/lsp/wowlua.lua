local logging = require("logging")

-- Capabilities for nvim-cmp (optional but recommended)
local ok_cmp, cmp_caps = pcall(function()
  return require("cmp_nvim_lsp").default_capabilities()
end)

vim.lsp.config.wowlua_ls = {
  cmd = function()
    local wowlua_ls = os.getenv("WOWLUA_LSP_PATH") or vim.fn.exepath("wowlua_ls")
    if wowlua_ls == "" then
      logging:warn("wowlua_ls not found (set $WOWLUA_LSP_PATH or add to PATH)")
      return { "wowlua_ls" }
    end
    return { wowlua_ls }
  end,
  filetypes = { 'lua' },
  root_markers = { '.wowluarc.json', '.toc', '.git' },
  workspace_required = false,
  capabilities = ok_cmp and cmp_caps or nil,
}

vim.lsp.enable("wowlua_ls")
