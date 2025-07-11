return {
	"nvim-telescope/telescope.nvim",
	"nvim-treesitter/nvim-treesitter",

	-- Autocomplete
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "onsails/lspkind.nvim" }
	},

	-- GIT
	{
  	'tanvirtin/vgit.nvim',
  	dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
  	-- Lazy loading on 'VimEnter' event is necessary.
  	event = 'VimEnter',
  	config = function() require("vgit").setup() end,
	},

	-- Color
	"ajmwagar/vim-deus",

	-- DAP
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio"
		}
	},
	-- "nicholasmata/nvim-dap-cs",
	"mfussenegger/nvim-dap-python",

	-- Terminal
	{
    "Dan7h3x/neaterm.nvim",
    branch = "stable",
    event = "VeryLazy",
		opts = {}, -- this line is super important
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ibhagwan/fzf-lua",
    },
}
}
