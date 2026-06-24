local logging = require("logging")

local pylsp = os.getenv("PYLSP_PATH") or vim.fn.exepath("pylsp")
if pylsp == "" then
  logging:warn("pylsp not found (set $PYLSP_PATH or add to PATH)")
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
      },
    },
  },
  capabilities = require("lsp.utils").get_capabilities(),
}

vim.lsp.enable("pylsp")
