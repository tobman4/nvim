-- Capabilities for nvim-cmp (optional but recommended)
local ok_cmp, cmp_caps = pcall(function()
  return require("cmp_nvim_lsp").default_capabilities()
end)

local pylsp = os.getenv("PYLSP_PATH") or vim.fn.exepath("pylsp")
if pylsp == "" then
  vim.notify("pylsp not found (set $PYLSP_PATH or add to PATH)", vim.log.levels.ERROR)
  return
end

vim.lsp.config.pylsp = {
  cmd = { pylsp },
  filetypes = { "python" },
  single_file_support = true,
  root_markers = {
    "pyproject.toml", "setup.cfg", "setup.py", "requirements.txt", ".git",
    "Pipfile", "poetry.lock"
  },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { maxLineLength = 100 },
        -- enable/disable others as you like:
        -- pylint = { enabled = true },
        -- pyflakes = { enabled = true },
        -- yapf = { enabled = false },
      },
    },
  },
  capabilities = ok_cmp and cmp_caps or nil,
}

vim.lsp.enable("pylsp")
