--
-- local function navic_info()
--     return require("nvim-navic").get_location()
-- end
--
-- local function navic_ok()
--     return require("nvim-navic").is_available()
-- end
--
-- local session = require('auto-session')
return {
  'nvim-lualine/lualine.nvim',
  opts =  {
    options = {
      theme = 'onedark',
    },
    sections = {
      lualine_a = {
        {
        'filename',
         path=0,
        },
    },
      -- lualine_x = { session.current_session_name },
    },
    tabline = {
      lualine_a = {
        {'buffers',hide_filename_extension = true, max_length = vim.o.columns },
      },
    },
  }
}
