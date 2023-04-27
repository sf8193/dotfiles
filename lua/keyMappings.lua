--[[ keys.lua ]]
local noremap = {noremap=true}
local opts = { unpack(noremap), silent=true }

vim.keymap.set('i', 'jk', '<esc>', noremap )
vim.keymap.set('n', '<C-j>', '<C-W>j', noremap )
vim.keymap.set('n', '<C-k>', '<C-W>k', noremap )
vim.keymap.set('n', '<C-h>', '<C-W>h', noremap )
vim.keymap.set('n', '<C-l>', '<C-W>l', noremap )

function ReloadAlpha()
    for k in pairs(package.loaded) do
        if k:match("^ghr") then
            package.loaded[k] = nil
        end
    end
  end

function Combine()
  ReloadAlpha()
  require("ghr")
end

vim.keymap.set('n', '<leader>pra', Combine, {})
vim.keymap.set('n', '<leader>ts', '<cmd>SearchSession<cr>')
vim.keymap.set('n', '<leader>j', '<cmd>Navbuddy<cr>', {})
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope grep_string<cr>')
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<leader>cb', '<cmd>Telescope neoclip<cr>')

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
vim.keymap.set('n', '<leader>gd', '<cmd>Git diff<cr>')
vim.keymap.set('n', 'zO', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[e', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']e', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setqflist, opts)

