-- Capabilities for nvim-cmp (optional but recommended)
local ok_cmp, cmp_caps = pcall(function()
  return require("cmp_nvim_lsp").default_capabilities()
end)

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function(args)
    local buf = args.buf
    local fname = vim.api.nvim_buf_get_name(buf)

    -- Resolve pylsp path (env var wins)
    local pylsp = os.getenv("PYLSP_PATH") or vim.fn.exepath("pylsp")
    if pylsp == "" then
      vim.notify("pylsp not found (set $PYLSP_PATH or add to PATH)", vim.log.levels.ERROR)
      return
    end

    vim.lsp.start({
      name = "pylsp",
      cmd = { pylsp },
      filetypes = { "python" },
      single_file_support = true,
      root_dir = vim.fs.root(fname, {
        "pyproject.toml", "setup.cfg", "setup.py", "requirements.txt", ".git",
        "Pipfile", "poetry.lock",
      }) or vim.loop.cwd(),
      init_options = {},
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
    })
  end,
})
