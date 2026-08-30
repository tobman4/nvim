local logging = require("logging")

local cmd = vim.fn.exepath("csharp-ls")
if cmd == "" then
  logging:warn("csharp-ls not found in PATH")
  return
end

local function extended_handler(...)
  return require("csharpls_extended").handler(...)
end

local handlers = {
  ["textDocument/definition"] = extended_handler,
  ["textDocument/typeDefinition"] = extended_handler,
}

vim.lsp.config.csharp_ls = {
  cmd = { cmd },
  filetypes = { "cs", "csx" },
  single_file_support = true,
  init_options = {
    AutomaticWorkspaceInit = true
  },
  settings = {
    csharp = {
      useMetadataUris = true
    }
  },
  capabilities = require("lsp.utils").get_capabilities(),
  handlers = handlers,
}

vim.lsp.enable("csharp_ls")
