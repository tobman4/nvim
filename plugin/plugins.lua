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
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'Hoffs/omnisharp-extended-lsp.nvim'
  use 'nvim-lua/plenary.nvim'
  -- use 'seandewar/nvimesweeper'
  use 'preservim/nerdtree'
  use 'ryanoasis/vim-devicons'
  use 'mhinz/vim-signify'

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

  --[[
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  ]]--

  use "lukas-reineke/indent-blankline.nvim"
  
  use {'ojroques/nvim-hardline'}
end)
