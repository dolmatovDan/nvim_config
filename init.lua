local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("vim-remaps")
require("ftplugin.cpp")
require("ftplugin.tex")
require("lazy").setup("plugins")

vim.api.nvim_create_autocmd(
  { "FIleType" },
  { pattern = "tex", group = optional_group, command = "TSBufDisable highlight" }
)
vim.api.nvim_set_keymap("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("s", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
