return {
'leoluz/nvim-dap-go',
  config = function()

    vim.api.nvim_set_keymap('n', '<F3>', [[<Cmd>lua require'dap-go'.debug_test()<CR>]], { noremap = true, silent = true })
  end,
} 
