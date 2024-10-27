-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set("i", "jk", "<ESC>")
vim.wo.number = true

vim.keymap.set("c", "<C-p>", "<Up>")

vim.keymap.set("c", "<C-n>", "<Down>")

-- Primeagen
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader><leader>p", '"0p')

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>c", '"+c')
vim.keymap.set("v", "<leader>c", '"+c')

vim.keymap.set("n", "Q", "<nop>")

-- quick fixes
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- End Primeagen

-- vim.keymap.set("n", "<Enter>", ":call append(line('.'), '')<CR>")
vim.keymap.set("n", "]b", ":bnext<CR>")
vim.keymap.set("n", "[b", ":bprev<CR>")
vim.keymap.set("n", "]B", ":bfirst<CR>")
vim.keymap.set("n", "[B", ":bnext<CR>")
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")

vim.keymap.set("c", "%%", "getcmdtype() == ':' ? expand('%:h').'/' : '%%'", {expr = true})

vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "G", "Gzz")

vim.keymap.set("v", "<leader>cs", ":s/\\S/&/g<CR>")

-- Define the function VSetSearch
function VSetSearch()
    local temp = vim.fn.getreg('s')  -- Get the contents of register 's'
    vim.cmd('normal! gv"sy')         -- Select the visually highlighted text and copy it to register 's'
    -- Set the search register '/' with the escaped content of register 's'
    local search_pattern = '\\V' .. vim.fn.substitute(vim.fn.escape(vim.fn.getreg('s'), '/\\'), '\n', '\\n', 'g')
    vim.fn.setreg('/', search_pattern)
    -- Restore the original content of register 's'
    vim.fn.setreg('s', temp)
end

-- Create mappings for visual mode
vim.api.nvim_set_keymap('x', '*', ':<C-u>lua VSetSearch()<CR>/<C-R>=@/<CR><CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '#', ':<C-u>lua VSetSearch()<CR>?<C-R>=@/<CR><CR>', { noremap = true, silent = true })
