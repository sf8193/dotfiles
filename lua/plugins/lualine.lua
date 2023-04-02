
local function navic_info()
    return require("nvim-navic").get_location()
end

local function navic_ok()
    return require("nvim-navic").is_available()
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies ={
    'nvim-navic'
  },
  config =  {
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
}
