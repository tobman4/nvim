local logging = require("logging")

local cmd = vim.fn.exepath("csharp-ls")
if cmd == "" then
  logging:warn("csharp-ls not found in PATH")
  return
end

local ok_cmp, cmp_caps = pcall(function()
  return require("cmp_nvim_lsp").default_capabilities()
end)

local handlers = {
  ["textDocument/definition"] = function(...)
    return require("csharpls_extended").handler(...)
  end,
  ["textDocument/typeDefinition"] = function(...)
    return require("csharpls_extended").handler(...)
  end,
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
  capabilities = ok_cmp and cmp_caps or nil,
  handlers = handlers,
}

vim.lsp.enable("csharp_ls")
