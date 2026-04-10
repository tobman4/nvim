vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
})

-- Optional: enhance completion via nvim-cmp
local ok_cmp, cmp_caps = pcall(function()
  return require("cmp_nvim_lsp").default_capabilities()
end)

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "rust" },
  callback = function(args)
    local buf = args.buf
    local fname = vim.api.nvim_buf_get_name(buf)

    -- Find rust-analyzer binary
    local ra = os.getenv("RUST_RA_PATH") vim.fn.exepath("rust-analyzer")
    if ra == "" then
      vim.notify("rust-analyzer not found in PATH", vim.log.levels.ERROR)
      return
    end

    vim.lsp.start({
      name = "rust_analyzer",
      cmd = { ra },
      filetypes = { "rust" },
      root_dir = vim.fs.root(fname, { "Cargo.toml", ".git" }) or vim.loop.cwd(),
      single_file_support = true,
      capabilities = ok_cmp and cmp_caps or nil,
      settings = {
        ["rust-analyzer"] = {
          cargo = { allFeatures = true },
          check = { command = "clippy" },
        },
      },
    })
  end,
})
