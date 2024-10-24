return {
  {
    "sindrets/diffview.nvim",
    lazy = true,
    cmd = {
      "DiffviewOpen",
      "DiffviewLog",
      "DiffviewFileHistory",
    },
    keys = {
      "<leader>Gdo",
      "<leader>GdO",
      "<leader>Gdc",
    },
    config = function()
      vim.keymap.set("n", "<leader>GdO", ":DiffviewOpen origin<CR>")
      vim.keymap.set("n", "<leader>Gdo", ":DiffviewOpen<CR>")
      vim.keymap.set("n", "<leader>Gdc", ":DiffviewClose<CR>")
    end,
  },
}
