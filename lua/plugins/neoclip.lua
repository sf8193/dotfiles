return {
  'AckslD/nvim-neoclip.lua',
  dependencies = 'nvim-telescope/telescope.nvim',
  config = {
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
