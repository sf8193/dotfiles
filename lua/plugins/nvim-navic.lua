return {
  'SmiteshP/nvim-navic',
  dependencies = 'neovim/nvim-lspconfig',
  event = 'LspAttach',
  config = {
     lsp = {
        auto_attach = true,
      },
  }
}
