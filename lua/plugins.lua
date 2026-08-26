return {
	"nvim-telescope/telescope.nvim",
	{ "nvim-treesitter/nvim-treesitter", branch = "main" },

	-- Autocomplete
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = { "onsails/lspkind.nvim" },
		config = function()
			local lspkind = require('lspkind')
			local cmp = require("cmp")
			cmp.setup {
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "buffer" }
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				view = {
					docs = {
						auto_open = true,
					},
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
					["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
					["<C-space>"] = cmp.mapping(
						cmp.mapping.confirm {
							behavior = cmp.ConfirmBehavior.Insert,
							select = true,
						},
						{ "i", "c" }
					)
				}),
				formatting = {
					format = lspkind.cmp_format({
						mode = 'symbol_text', -- show only symbol annotations
						maxwidth = {
							-- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
							-- can also be a function to dynamically calculate max width such as
							-- menu = function() return math.floor(0.45 * vim.o.columns) end,
							menu = 50, -- leading text (labelDetails)
							abbr = 50, -- actual suggestion item
						},
						ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
						show_labelDetails = true, -- show labelDetails in menu. Disabled by default
					})
				},
				snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end }
			}
		end
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
			{ "nvim-treesitter/nvim-treesitter", branch = "main" }, -- optional
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
