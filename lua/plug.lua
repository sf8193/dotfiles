return require('lazy').setup({
   { 'nvim-telescope/telescope.nvim',                 -- fuzzy finder
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },
   {'nvim-telescope/telescope-fzf-native.nvim', build= 'make' },

   "windwp/nvim-autopairs",
   'tpope/vim-surround',
   'numToStr/Comment.nvim',
   {'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async'},
   {"akinsho/toggleterm.nvim", version = '*'},
   {
      "SmiteshP/nvim-navbuddy",
      dependencies = {
          "neovim/nvim-lspconfig",
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim"
      }
    },
   'navarasu/onedark.nvim',
   'lewis6991/gitsigns.nvim',
   {'ruifm/gitlinker.nvim',dependencies = 'nvim-lua/plenary.nvim'},
   'tpope/vim-fugitive',-- git integration
   {'kyazdani42/nvim-tree.lua',dependencies = 'kyazdani42/nvim-web-devicons'},
   'nvim-lualine/lualine.nvim',
   {"AckslD/nvim-neoclip.lua", dependencies = {{'nvim-telescope/telescope.nvim'},},},
   'phaazon/hop.nvim', branch = 'v2',

   'nvim-treesitter/nvim-treesitter',
   'nvim-treesitter/nvim-treesitter-textobjects',
   'hrsh7th/cmp-nvim-lsp',
   'hrsh7th/cmp-buffer',
   'hrsh7th/cmp-path',
   'hrsh7th/cmp-cmdline',
   'hrsh7th/nvim-cmp',
   'L3MON4D3/LuaSnip',
   'saadparwaiz1/cmp_luasnip',
   "rafamadriz/friendly-snippets",
   'neovim/nvim-lspconfig'
})
