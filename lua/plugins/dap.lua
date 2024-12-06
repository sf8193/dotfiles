return {
  'mfussenegger/nvim-dap',  -- nvim-dap plugin
  config = function()
    local dap = require('dap')


    -- Configure the Go adapter
    dap.adapters.go = {
      type = 'server',
      port = '${port}',
      executable = {
        command = 'dlv',
        args = {'dap', '-l', '127.0.0.1:${port}'},
      }
    }

    dap.configurations.go = {
      {
        type = 'go',
        name = 'Debug',
        request = 'launch',
        program = '${file}',
      },
      {
        type = 'go',
        name = 'Debug Package',
        request = 'launch',
        program = '${workspaceFolder}', -- Use the workspace folder to debug the entire package
      },
    }

    -- Set up key mappings for debugging
    vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
    vim.fn.sign_define('DapStopped', {text='➡️', texthl='', linehl='', numhl=''})

    vim.api.nvim_set_keymap('n', '<F6>', [[<Cmd>lua require'dap'.continue()<CR>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<F7>', [[<Cmd>lua require'dap'.step_over()<CR>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<F8>', [[<Cmd>lua require'dap'.step_into()<CR>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<F12>', [[<Cmd>lua require'dap'.step_out()<CR>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>b', [[<Cmd>lua require'dap'.toggle_breakpoint()<CR>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>B', [[<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>lp', [[<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<F5>', [[<Cmd>lua require'dap'.repl.open()<CR>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<F4>', [[<Cmd>lua require'dap'.terminate()<CR>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>dl', [[<Cmd>lua require'dap'.run_last()<CR>]], { noremap = true, silent = true })
  end,
}
