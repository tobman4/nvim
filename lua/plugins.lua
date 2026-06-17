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
		dependencies = { "onsails/lspkind.nvim" },
		event = "InsertEnter",
		config = function()
			require("nvim-cmp")
		end,
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
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				lightbulb = {
					enable = true,
					sign = true,
					virtual_text = true,
				},
				symbol_in_winbar = {
					enable = true,
				},
			})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons",     -- optional
		},
	},

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

	-- Tabline
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},

  -- Notify
  "rcarriga/nvim-notify"
}
