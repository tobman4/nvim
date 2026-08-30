local logging = require("logging")

local ok_cmp, cmp_caps = pcall(function()
  return require("cmp_nvim_lsp").default_capabilities()
end)

local bash_cmd = os.getenv("BASH_LANGUAGE_SERVER_PATH") or vim.fn.exepath("bash-language-server")
if bash_cmd == "" then
  logging:warn("bash-language-server not found (set $BASH_LANGUAGE_SERVER_PATH or add to PATH)")
  return
end

vim.lsp.config.bashls = {
  cmd = { bash_cmd, "start" },
  filetypes = { "sh", "bash" },
  single_file_support = true,
  capabilities = ok_cmp and cmp_caps or nil,
}

vim.lsp.enable("bashls")
