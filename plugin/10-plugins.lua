return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      "nvim-treesitter/nvim-treesitter"
    }
  }

  -- Autocompletion
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-vsnip'

  -- use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  -- use 'Hoffs/omnisharp-extended-lsp.nvim'
  use 'Decodetalkers/csharpls-extended-lsp.nvim'
  use 'nvim-lua/plenary.nvim'
  -- use 'seandewar/nvimesweeper'
  use 'preservim/nerdtree'
  use 'ryanoasis/vim-devicons'
  use 'mhinz/vim-signify'

  use 'b0o/schemastore.nvim'

  use "ray-x/lsp_signature.nvim"

  use 'preservim/tagbar'
  use 'xiyaowong/transparent.nvim'
  use 'AlessandroYorba/Sierra'

  -- use 'ms-jpq/coq_nvim'
  -- use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }

  use 'tpope/vim-commentary'
  use 'prisma/vim-prisma'

  -- TabLine
  -- use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
  use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
  -- use 'romgrk/barbar.nvim'

  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  use 'vimwiki/vimwiki'

  use {
    "someone-stole-my-name/yaml-companion.nvim",
    requires = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
    end,
  }

  -- use {
  --   "m4xshen/hardtime.nvim",
  --   requires = {
  --     { "MunifTanjim/nui.nvim" },
  --     { "nvim-lua/plenary.nvim" },
  --   }
  -- }

  --[[
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  ]]--

  use "lukas-reineke/indent-blankline.nvim"

  use {'ojroques/nvim-hardline'}
  
  use { "Tastyep/structlog.nvim" }

  -- Color
  use 'catppuccin/nvim'
  use 'lunarvim/Onedarker.nvim'
  use 'lunarvim/lunar.nvim'
end)
