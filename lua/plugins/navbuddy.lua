return {
      'SmiteshP/nvim-navbuddy',
      dependencies = {
          'neovim/nvim-lspconfig',
          'SmiteshP/nvim-navic',
          'MunifTanjim/nui.nvim'
      },
      event = 'LspAttach',
      config = {
         lsp = {
            auto_attach = true,
          },
      }
    }
