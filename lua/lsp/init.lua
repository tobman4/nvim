vim.fn.sign_define("DiagnosticSignError", { text = "🚨", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",  { text = "👎", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",  { text = "ℹ️", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",  { text = "🧠", texthl = "DiagnosticSignHint" })

vim.diagnostic.config({
  virtual_text = {
    -- Setting update_in_insert to false improves typing performance significantly
    -- by avoiding continuous diagnostic re-evaluation during insert mode.
    update_in_insert = false,
  },
  signs = true,
  underline = true,
  -- Setting update_in_insert to false improves typing performance significantly
  -- by avoiding continuous diagnostic re-evaluation during insert mode.
  update_in_insert = false
})

require("lsp.lua")
require("lsp.dotnet")
require("lsp.python")
