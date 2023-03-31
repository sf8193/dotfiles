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

-- Lua
require('onedark').setup {
    style = 'warmer'
}
require('onedark').load()

require('nvim-tree').setup{
    filters = {
      dotfiles = true,
    },
    hijack_cursor=true,
}
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
require"gitlinker".setup({
  callbacks = {
    ["git.blendlabs.com"] = function(url_data)
        local url = require"gitlinker.hosts".get_base_https_url(url_data) ..
          "/blob/" .. url_data.rev .. "/" .. url_data.file
        if url_data.lstart then
          url = url .. "#L" .. url_data.lstart
          if url_data.lend then url = url .. "-L" .. url_data.lend end
        end
        return url
      end
  }
})


local actions = require('telescope.actions');
require('telescope').setup{
  defaults = {
    path_display = {
      "truncate"
    },
    wrap_results = true,
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
        ["jk"] = actions.close,
        ["<C-k>"] = "move_selection_previous",
        ["<C-j>"] = "move_selection_next",
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
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
    -- extension_name  = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('neoclip')
require('neoclip').setup({
      default_register = '*',
      keys = {
        telescope = {
          i = {
            paste_behind = '<c-o>',
          },
        },
      }
})

local function navic_info()
    return require("nvim-navic").get_location()
end

local function navic_ok()
    return require("nvim-navic").is_available()
end


require('lualine').setup{
  options = {
    theme = 'onedark',
  },
  sections = {
  --   lualine_a = {
  --     {
  --     'filename',
  --      path=0,
  --     },
  -- },
    lualine_x = {{
        navic_info,
        cond = navic_ok
    }},
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
require('Comment').setup()

require("toggleterm").setup{
  open_mapping = [[<c-\>]],
}


