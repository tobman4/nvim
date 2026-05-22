local cmd = vim.fn.exepath("csharp-ls")
if cmd == "" then
  vim.notify("csharp-ls not found in PATH", vim.log.levels.ERROR)
  return
end

local ok_cmp, cmp_caps = pcall(function()
  return require("cmp_nvim_lsp").default_capabilities()
end)

vim.lsp.config.csharp_ls = {
  cmd = { cmd },
  filetypes = { "cs", "csx" },
  single_file_support = true,
  init_options = {
    AutomaticWorkspaceInit = true
  },
  capabilities = ok_cmp and cmp_caps or nil,
}

vim.lsp.enable("csharp_ls")
