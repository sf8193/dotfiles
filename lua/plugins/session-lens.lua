return {
  'rmagatti/session-lens',
  dependencies = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
  opts = {
    path_display={'shorten'},
    prompt_title = 'sessions',
  }
}
