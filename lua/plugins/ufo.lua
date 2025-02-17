return {
  'kevinhwang91/nvim-ufo',
  ft = {"ts", "js", "jsx", "go", "cpp"},
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
