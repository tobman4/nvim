vim.lsp.enable('csharp_ls')
vim.lsp.config['csharp_ls'] = {
	cmd = { "csharp-ls" },
	filetpyes = "cs",
	init_options = {
		AutomaticWorkspaceInit = true
	}
}
