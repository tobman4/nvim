-- Capabilities for nvim-cmp (optional but recommended)
local ok_cmp, cmp_caps = pcall(function()
  return require("cmp_nvim_lsp").default_capabilities()
end)

local yamlls = os.getenv("YAMLLS_PATH") or vim.fn.exepath("yaml-language-server")
if yamlls == "" then
  vim.notify("yaml-language-server not found (set $YAMLLS_PATH or add to PATH)", vim.log.levels.ERROR)
  return
end

vim.lsp.config.yamlls = {
  cmd = { yamlls, "--stdio" },
  filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
  single_file_support = true,
  settings = {
    yaml = {
      format = {
        enable = true,
      },
      validate = true,
      hover = true,
      completion = true,
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
    },
  },
  capabilities = ok_cmp and cmp_caps or nil,
}

vim.lsp.enable("yamlls")
