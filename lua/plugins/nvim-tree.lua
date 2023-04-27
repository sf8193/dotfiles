local function find_and_focus_file()
  local tree = require('nvim-tree.api').tree
  if tree.is_visible({}) then
    tree.toggle()
    return
  end
  tree.find_file({
    focus = true,
    open = true,
  })
end

return {
  'kyazdani42/nvim-tree.lua',
  dependencies = 'kyazdani42/nvim-web-devicons',
  keys = {
    {'<leader>n', '<cmd>NvimTreeToggle<cr>', desc = 'nvim tree'},
    {'<leader>o', find_and_focus_file, desc = 'nvim tree'}
  },
  config = true,
}
