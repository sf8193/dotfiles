return {
    'ldelossa/gh.nvim',
    dependencies = 'ldelossa/litee.nvim',
    config = function()
      require('litee.lib').setup({
        tree = {
          icon_set = "nerd",
        },
      })
      require('litee.gh').setup({
          icon_set = "nerd",
      })
      end
  }
