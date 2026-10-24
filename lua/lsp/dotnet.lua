local logging = require("logging")

local ok_cmp, cmp_caps = pcall(function()
  return require("cmp_nvim_lsp").default_capabilities()
end)

local function extended_handler(...)
  return require("csharpls_extended").handler(...)
end

local handlers = {
  ["textDocument/definition"] = extended_handler,
  ["textDocument/typeDefinition"] = extended_handler,
}

vim.lsp.config.csharp_ls = {
  cmd = function()
    local cmd = vim.fn.exepath("csharp-ls")
    if cmd == "" then
      logging:warn("csharp-ls not found in PATH")
      return nil
    end
    return { cmd }
  end,
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
