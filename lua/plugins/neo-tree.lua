return {
  'nvim-neo-tree/neo-tree.nvim',
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function ()
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

   require("neo-tree").setup({
     filesystem = {
       window = {
         mappings = {
           ["y"] = {
             "copy_to_clipboard",
             nowait = true,
             config = {
               show_path = "none" -- "none", "relative", "absolute"
             }
           },
         }
       }
     }
   })
    end
}
