return {
  'kevinhwang91/nvim-bqf',
  ft = 'qf',
  opts = {
    auto_enable = true,
    preview = {
      win_height = 12,
      win_vheight = 12,
      delay_syntax = 80,
      border = { '┏', '━', '┓', '┃', '┛', '━', '┗', '┃' },
    },
    func_map = {
      ptogglemode = 'z,',
      stoggleup = '',
      nextfile = '<C-]>',
      prevfile = '<C-[>',
      pscrollup = '<C-u>',
      pscrolldown = '<C-y>'
    },
    filter = {
      fzf = {
        action_for = { ['ctrl-s'] = 'split' },
        extra_opts = { '--bind', 'ctrl-o:toggle-all', '--prompt', '> ' }
      }
    }
  }
}
