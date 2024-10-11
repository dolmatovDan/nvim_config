return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          component_separators = "|",
          section_separators = "",
          theme = "gruvbox",
        },
      })
    end,
  },
}
