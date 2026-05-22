vim.fn.sign_define("DiagnosticSignError", { text = "🚨", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",  { text = "👎", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",  { text = "ℹ️", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",  { text = "🧠", texthl = "DiagnosticSignHint" })

vim.diagnostic.config({
  virtual_text = {
    -- Disable update_in_insert to prevent unnecessary diagnostic re-evaluation
    -- during typing, which reduces input latency and CPU usage.
    update_in_insert = false,
  },
  signs = true,
  underline = true,
  -- Disable update_in_insert to prevent unnecessary diagnostic re-evaluation
  -- during typing, which reduces input latency and CPU usage.
  update_in_insert = false
})

require("lsp.lua")
require("lsp.dotnet")
require("lsp.python")
require("lsp.rust")
