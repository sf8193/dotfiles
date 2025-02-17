return {
  'AckslD/nvim-neoclip.lua',
  dependencies = 'nvim-telescope/telescope.nvim',
  opts = {
    default_register = '*',
        keys = {
          telescope = {
            i = {
              paste_behind = '<c-o>',
            },
          },
        }
    }
}
