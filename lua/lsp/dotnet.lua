local cmd = vim.fn.exepath("csharp-ls")
if cmd == "" then
  vim.notify("csharp-ls not found in PATH", vim.log.levels.ERROR)
  return
end

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
