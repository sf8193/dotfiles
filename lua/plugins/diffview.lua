return {
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open diff view" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Open file history" },
    { "<leader>gB", "<cmd>DiffviewOpen origin/HEAD...HEAD --imply-local<cr>", desc = "Review branch changes" },
    { "<leader>gc", "<cmd>DiffviewClose<CR>", desc = "close view" },
    { "<leader>gm", "<cmd>DiffviewOpen! --merge<cr>", desc = "Open merge conflicts" },
  },
  config = function()
    vim.opt.diffopt = vim.opt.diffopt
      + {
        "internal",
        "filler",
        "closeoff",
        "algorithm:minimal",
        "indent-heuristic",
        "linematch:30",
        "hiddenoff",
      }

    require("diffview").setup({
      enhanced_diff_hl = true,
      use_icons = true,
      view = {
        merge_tool = {
          layout = "diff3_mixed",
          disable_diagnostics = true,
          winbar_info = true,
        },
      },
    })
  end,
}
