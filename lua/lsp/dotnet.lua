local cmd = vim.fn.exepath("csharp-ls")
local ok_cmp, cmp_caps = pcall(function()
  return require("cmp_nvim_lsp").default_capabilities()
end)


vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cs", "csx" },
  callback = function()
    vim.lsp.enable("csharp_ls")
		vim.lsp.start({
      name = "csharp_ls",
      cmd = { cmd },
      filetypes = { "cs", "csx" },
      single_file_support = true,
      init_options = {
				AutomaticWorkspaceInit = true
			},
			capabilities = ok_cmp and cmp_caps or nil,

    })
  end,
})
