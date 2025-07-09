vim.lsp.enable('pylsp')
vim.lsp.config('pylsp', {
  cmd = { os.getenv("PYLSP_PATH") or "pylsp" },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          maxLineLength = 100
        }
      }
    }
  }
})
