local logging = require("logging")

-- Capabilities for nvim-cmp (optional but recommended)
local ok_cmp, cmp_caps = pcall(function()
  return require("cmp_nvim_lsp").default_capabilities()
end)

local pyright = os.getenv("PYRIGHT_PATH")
if not pyright or pyright == "" then
  local lsp_pyright = vim.fn.expand("~/lsp/env/bin/pyright-langserver")
  if vim.fn.executable(lsp_pyright) == 1 then
    pyright = lsp_pyright
  end
end
if not pyright or pyright == "" then
  pyright = vim.fn.exepath("pyright-langserver")
end
if pyright == "" then
  logging:warn("pyright not found (set $PYRIGHT_PATH or add it to PATH)")
  return
end

-- Find the project's virtualenv interpreter so pyright can resolve
-- imports from installed packages. Includes `.env` since this project
-- uses that instead of the usual `.venv`.
local function venv_python(root)
  if not root then
    return nil
  end
  for _, name in ipairs({ ".venv", "venv", "env", ".env" }) do
    local python = root .. "/" .. name .. "/bin/python"
    if vim.fn.executable(python) == 1 then
      return vim.fs.normalize(python)
    end
  end
  return nil
end

vim.lsp.config.pyright = {
  cmd = { pyright, "--stdio" },
  filetypes = { "python" },
  single_file_support = true,
  root_markers = {
    "pyproject.toml", "setup.cfg", "setup.py", "requirements.txt", ".git",
    "Pipfile", "poetry.lock", "pyrightconfig.json",
  },
  capabilities = ok_cmp and cmp_caps or nil,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
  on_init = function(client)
    local python = venv_python(client.root_dir)
    if not python then
      return
    end
    -- Use a per-client copy so multiple projects don't overwrite each other.
    client.settings = vim.deepcopy(client.settings)
    client.settings.python = client.settings.python or {}
    client.settings.python.pythonPath = python
    client:notify("workspace/didChangeConfiguration", { settings = client.settings })
  end,
}

vim.lsp.enable("pyright")
