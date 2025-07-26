return {
   'nvim-treesitter/nvim-treesitter',
   build = ":TSUpdate",
   dependencies = 'nvim-treesitter/nvim-treesitter-textobjects',
   config = function ()
    require('nvim-treesitter.configs').setup({
      highlight = {
        -- `false` will disable the whole extension
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          }
        },
      },
      ensure_installed = {
        'javascript',
        'typescript',
        'tsx',
        'css',
        'json',
        'lua',
        'scala', -- Add this line
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      -- Automatically install missing parsers when entering buffer
      auto_install = true,
    })

   end
}
