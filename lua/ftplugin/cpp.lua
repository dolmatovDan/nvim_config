-- Comments for cpp
-- Create an autocmd group for setting commentstring
vim.api.nvim_create_augroup("SetCommentStringAG", { clear = true })

-- Autocommand for entering a buffer
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.cpp", "*.h" },
    callback = function()
        vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
    end,
})

-- Autocommand for changing the file name
vim.api.nvim_create_autocmd("BufFilePost", {
    pattern = { "*.cpp", "*.h" },
    callback = function()
        vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
    end,
})
