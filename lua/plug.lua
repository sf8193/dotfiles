return require('packer').startup({function(use)
  use {'wbthomason/packer.nvim'}
  use { 'nvim-telescope/telescope.nvim',                 -- fuzzy finder
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {"windwp/nvim-autopairs"}
  use {'tpope/vim-surround'}
  use {'numToStr/Comment.nvim' }
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
  use {"akinsho/toggleterm.nvim", tag = '*'}

  use {'lifepillar/vim-gruvbox8'}
  use {
      "SmiteshP/nvim-navbuddy",
      requires = {
          "neovim/nvim-lspconfig",
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim"
      }
  }
  use {'navarasu/onedark.nvim'}
  -- use { "sainnhe/gruvbox-material" }

  use {'lewis6991/gitsigns.nvim' }
  use {'ruifm/gitlinker.nvim',requires = 'nvim-lua/plenary.nvim'}
  use {'tpope/vim-fugitive'}                       -- git integration
  use {'kyazdani42/nvim-tree.lua',requires = 'kyazdani42/nvim-web-devicons'}
  use {'nvim-lualine/lualine.nvim'}

  use {"AckslD/nvim-neoclip.lua", requires = {{'nvim-telescope/telescope.nvim'},},}
  use { 'phaazon/hop.nvim', branch = 'v2' }

  use {'nvim-treesitter/nvim-treesitter'}
  use {'nvim-treesitter/nvim-treesitter-textobjects'}
  use { 'hrsh7th/cmp-nvim-lsp'}
  use { 'hrsh7th/cmp-buffer'  }
  use { 'hrsh7th/cmp-path'    }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/nvim-cmp'    }
  use { 'L3MON4D3/LuaSnip'    }
  use { 'saadparwaiz1/cmp_luasnip' }
  use {"rafamadriz/friendly-snippets"}
  use {'neovim/nvim-lspconfig'}

  end,
  config = { package_root = vim.fn.stdpath('config') .. '/site/pack'},
})
