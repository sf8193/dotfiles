local noremap = { noremap = true }
local opts = { unpack(noremap), silent = true }

vim.keymap.set('i', 'jk', '<esc>', noremap)
vim.keymap.set('n', '<C-j>', '<C-W>j', noremap)
vim.keymap.set('n', '<C-k>', '<C-W>k', noremap)
vim.keymap.set('n', '<C-h>', '<C-W>h', noremap)
vim.keymap.set('n', '<C-l>', '<C-W>l', noremap)
vim.keymap.set('n', '<leader>D', '"_d', noremap)

vim.keymap.set('n', '<leader>j', '<cmd>Navbuddy<cr>', {})
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope registers<cr>')
vim.keymap.set('n', '<leader>?', '<cmd>Telescope keymaps<cr>')
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope grep_string<cr>')
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<leader>cb', '<cmd>Telescope neoclip<cr>')

vim.keymap.set({ 'n', 'x', 'o' }, 'f', '<Plug>(leap)')
vim.keymap.set({ 'n', 'x', 'o' }, 'F', '<Plug>(leap-backward)')
vim.keymap.set({ 'n', 'x', 'o' }, 'gf', '<Plug>(leap-from-window)')

vim.keymap.set('n', '<C-;>', '<cmd>HopWord<cr>')
vim.keymap.set('n', '<C-w>', '<cmd>bd<cr>')
vim.keymap.set('n', '<C-p>', '<cmd>bprev<cr>')
vim.keymap.set('n', '<C-t>', '<cmd>bnext<cr>')
vim.keymap.set('n', '<C-n>', '<cmd>cnext<cr>')
vim.keymap.set('n', '<C-b>', '<cmd>cprevious<cr>')
vim.keymap.set('n', '<C-g>', '<cmd>Gitsigns setqflist all<cr>')
vim.keymap.set('n', '[g', '<cmd>Gitsigns prev_hunk<cr>')
vim.keymap.set('n', ']g', '<cmd>Gitsigns next_hunk<cr>')
vim.keymap.set('n', '<leader>gb', '<cmd>Git blame<cr>')
vim.keymap.set('n', '<leader>gs', '<cmd>Gitsigns stage_hunk<cr>')
vim.keymap.set('n', '<leader>grh', '<cmd>Gitsigns reset_hunk<cr>')
vim.keymap.set('n', '<leader>grb', '<cmd>Gitsigns reset_buffer<cr>')
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, opts)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[e', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']e', vim.diagnostic.goto_next, opts)
-- Do the below to make quitting a buffer faster, and these are the same as <leader>e for me
vim.keymap.del('n', '<C-W>d')
vim.keymap.del('n', '<C-W><C-D>')

vim.keymap.set("n", "<leader>tv", "<cmd>PrtChatToggle<cr>", { desc = "Toggle Parrot Chat vsplit" })
vim.keymap.set("n", "<leader>tn", "<cmd>PrtChatNew<cr>", { desc = "Toggle Parrot Chat new" })
vim.keymap.set("n", "<leader>ty", "<cmd>PrtChatToggle popup<cr>", { desc = "Toggle Parrot Chat in popup" })
vim.keymap.set("n", "<leader>tcm", "<cmd>PrtCommitMsg popup<cr>", { desc = "show me commit message for changes" })
vim.keymap.set("n", "<leader>tf", "<cmd>PrtChatFinder popup<cr>", { desc = "show me chats" })
vim.keymap.set("n", "<leader>trf", "<cmd>PrtRefactorFile<cr>", { desc = "refactor whole file" })
vim.keymap.set("n", "<leader>tu", "<cmd>PrtTestFile<cr>", { desc = "write tests for whole file" })

vim.keymap.set("v", "<leader>trf", "<cmd>'<,'>PrtRefactorFileSelection<cr>", { desc = "refactor selected code with file context" })
vim.keymap.set("v", "<leader>tpv", "<cmd>'<,'>PrtChatPaste vsplit<cr>", { desc = "paste into vsplit" })
vim.keymap.set("v", "<leader>th", "<cmd>'<,'>PrtFeatureHelpSelection vsplit<cr>", { desc = "refactor selected code with file context" })
vim.keymap.set("v", "<leader>te", "<cmd>'<,'>PrtExplainSelection vsplit<cr>", { desc = "explain selected code" })


vim.keymap.set({ "n", "v" }, "<leader>tdm", function()
  if vim.fn.mode() == "v" or vim.fn.mode() == "V" or vim.fn.mode() == "\22" then
    vim.cmd("'<,'>PrtDebug")
  else
    vim.cmd("PrtDebug")
  end
end, { desc = "Debug multicontext with selection" })

vim.keymap.set({ "n", "v" }, "<leader>tdf", function()
  if vim.fn.mode() == "v" or vim.fn.mode() == "V" or vim.fn.mode() == "\22" then
    vim.cmd("'<,'>PrtDebugFile")
  else
    vim.cmd("PrtDebugFile")
  end
end, { desc = "Debug file with context or selection" })

vim.keymap.set({ "n", "v" }, "<leader>td", function()
  if vim.fn.mode() == "v" or vim.fn.mode() == "V" or vim.fn.mode() == "\22" then
    vim.cmd("'<,'>PrtDebugSelection")
  else
    vim.cmd("PrtDebugSelection")
  end
end, { desc = "Debug selection" })
