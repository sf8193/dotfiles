return {
  'kevinhwang91/nvim-ufo',
  ft = {"typescript", "typescriptreact", "js", "javascriptreact", "go", "scala", "ruby", "yaml"},
  dependencies = {
    'kevinhwang91/promise-async',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
      provider_selector = function(bufnr, filetype, buftype)
          return {'treesitter', 'indent'}
      end
  }
}
