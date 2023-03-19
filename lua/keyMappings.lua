--[[ keys.lua ]]

vim.keymap.set('i', 'jk', '<esc>', {})
vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeToggle<cr>', {})
vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
vim.keymap.set('n', '<C-;>', '<cmd>HopWord<cr>')
vim.keymap.set('n', '<C-w>', '<cmd>bd<cr>')
vim.keymap.set('n', '<C-p>', '<cmd>bprev<cr>')
vim.keymap.set('n', '<C-t>', '<cmd>bnext<cr>')

vim.keymap.set('n', '<C-n>', '<cmd>cnext<cr>')
vim.keymap.set('n', '<C-b>', '<cmd>cprevious<cr>')
vim.keymap.set('n', '<C-g>', '<cmd>Gitsigns setqflist all<cr>')
vim.keymap.set('n', '[g', '<cmd>Gitsigns prev_hunk<cr>')
vim.keymap.set('n', ']g', '<cmd>Gitsigns next_hunk<cr>')
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[e', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']e', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setqflist, opts)


