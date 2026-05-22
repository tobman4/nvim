return {
	"nvim-telescope/telescope.nvim",
	"nvim-treesitter/nvim-treesitter",

	-- Autocomplete
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "onsails/lspkind.nvim" }
	},
	{
  	"ray-x/lsp_signature.nvim",
  	event = "InsertEnter",
  	opts = {
			-- cfg options
			toggle_key_flip_floatwin_setting = true
  	}
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

	-- File Explorer
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				view = {
					side = "right",
				},
			})
		end,
	},

	-- LSP Enhancements
	"Decodetalkers/csharpls-extended-lsp.nvim",

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
