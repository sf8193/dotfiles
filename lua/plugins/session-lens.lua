return {
  'rmagatti/session-lens',
  dependencies = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
  keys = {
    {'<leader>ts', '<cmd>SearchSession<cr>', desc = 'search session'},
  },
  opts = {
    path_display={'shorten'},
    prompt_title = 'sessions',
  }
}
