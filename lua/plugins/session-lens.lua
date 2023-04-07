return {
  'rmagatti/session-lens',
  dependencies = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
  config = {
    path_display={'shorten'},
    prompt_title = 'sessions',
  }
}
