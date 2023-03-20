--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = " "
vim.g.localleader = "\\"

-- IMPORTS
require('vars')      -- Variables
require('lsp')
require('opts')      -- Options
require('keymappings')      -- Keymaps
require('plug')      -- Plugins
require('snippets')

-- Lua
require('onedark').setup {
    style = 'warmer'
}

require('onedark').load()

require('nvim-tree').setup{}
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
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
})
require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
})
require('gitsigns').setup{}

local actions = require('telescope.actions');
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
        ["<C-k>"] = "move_selection_previous",
        ["<C-j>"] = "move_selection_next",
        ["<C-q>"] = actions.smart_add_to_qflist + actions.open_qflist,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
require('telescope').load_extension('fzf')

require('lualine').setup{
  options = {
    theme = 'onedark',
  },
  sections = {
    lualine_a = {
      {
      'filename',
       path=1,
      },
  },
    lualine_x = {},
  },
  tabline = {
    lualine_a = {
      {'buffers',hide_filename_extension = true, max_length = vim.o.columns },
    },
  },
}

require'hop'.setup{ keys = 'etovxqpdygfblzhckisuran' }
require("nvim-autopairs").setup({
  check_ts = true,
})

-- require("autoclose").setup({
--      keys = {
--    },
--    options = {
--       disabled_filetypes = { "TelescopePrompt" },
--    },
-- })
require('Comment').setup()

