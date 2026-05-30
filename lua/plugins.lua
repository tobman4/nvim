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
	"rose-pine/neovim",

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
	},

	-- AI Agent
	{
		"carlos-algms/agentic.nvim",
		opts = {
			provider = "gemini-acp",
		},
		keys = {
			{
				"<C-\\>",
				function() require("agentic").toggle() end,
				mode = { "n", "v", "i" },
				desc = "Toggle Agentic Chat"
			},
			{
				"<C-'>",
				function() require("agentic").add_selection_or_file_to_context() end,
				mode = { "n", "v" },
				desc = "Add file or selection to Agentic to Context"
			},
			{
				"<C-,>",
				function() require("agentic").new_session() end,
				mode = { "n", "v", "i" },
				desc = "New Agentic Session"
			},
			{
				"<A-i>r",
				function() require("agentic").restore_session() end,
				desc = "Agentic Restore session",
				silent = true,
				mode = { "n", "v", "i" },
			},
			{
				"<leader>ad",
				function() require("agentic").add_current_line_diagnostics() end,
				desc = "Add current line diagnostic to Agentic",
				mode = { "n" },
			},
			{
				"<leader>aD",
				function() require("agentic").add_buffer_diagnostics() end,
				desc = "Add all buffer diagnostics to Agentic",
				mode = { "n" },
			},
		},
	},
}
