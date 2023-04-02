return {
   {'nvim-telescope/telescope-fzf-native.nvim', build= 'make' },
   {
      'SmiteshP/nvim-navbuddy',
      dependencies = {
          'neovim/nvim-lspconfig',
          'SmiteshP/nvim-navic',
          'MunifTanjim/nui.nvim'
      }
    },
   'tpope/vim-fugitive',-- git integration
   'tpope/vim-surround',
   'hrsh7th/cmp-nvim-lsp',
   'hrsh7th/cmp-buffer',
   'hrsh7th/cmp-path',
   'hrsh7th/cmp-cmdline',
   'hrsh7th/nvim-cmp',
   'L3MON4D3/LuaSnip',
   'saadparwaiz1/cmp_luasnip',
   'rafamadriz/friendly-snippets',
   'neovim/nvim-lspconfig'
}
