vim.fn.sign_define("DiagnosticSignError", { text = "🚨", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",  { text = "👎", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",  { text = "ℹ️", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",  { text = "🧠", texthl = "DiagnosticSignHint" })

vim.diagnostic.config({
  virtual_text = {
    update_in_insert = true,
  },
  signs = true,
  underline = true,
  update_in_insert = true
})

require("lsp.lua")
require("lsp.dotnet")
require("lsp.python")
