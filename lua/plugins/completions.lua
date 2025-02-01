return {
  {
    "quangnguyen30192/cmp-nvim-ultisnips",
  },
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    requires = {
      { "kdheepak/cmp-latex-symbols" },
    },
    sources = {
      {
        name = "latex_symbols",
        option = {
          strategy = 0, -- mixed
        },
      },
    },
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
        },
      })
      -- Key mapping to show signature help in insert mode
      vim.api.nvim_set_keymap(
        "i",
        "<C-k>",
        "<cmd>lua vim.lsp.buf.signature_help()<CR>",
        { noremap = true, silent = true }
      )
      -- vim.api.nvim_create_augroup("LspSignatureHelp", { clear = true })
      -- vim.api.nvim_create_autocmd("CursorHoldI", {
      --   group = "LspSignatureHelp",
      --   pattern = "*",
      --   callback = function()
      --     vim.lsp.buf.signature_help()
      --   end,
      -- })
      -- vim.lsp.handlers["textDocument/signatureHelp"] =
      --     vim.lsp.with(vim.lsp.handlers.signature_help, { focusable = false })
    end,
  },
}
