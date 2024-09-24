return {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local dotnet = require("easy-dotnet")
    dotnet.setup({})
    vim.keymap.set("n", "<leader>nt", function()
      dotnet.test_solution()
    end)
    vim.keymap.set("n", "<leader>nr", function()
      dotnet.run_default()
    end)
  end,
}
