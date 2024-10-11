return {
	"nvim-neotest/neotest",
	dependencies = {
		"Issafalcon/neotest-dotnet",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-dotnet"),
			},
		})
		vim.api.nvim_set_keymap("n", "<leader>tr", ":lua require('neotest').run.run()<CR>", {})
		vim.api.nvim_set_keymap("n", "<leader>ts", ":lua require('neotest').run.stop()<CR>", {})
		vim.api.nvim_set_keymap("n", "<leader>to", ":lua require('neotest').output.open()<CR>", {})
		vim.api.nvim_set_keymap("n", "<leader>tO", ":lua require('neotest').output.open({ enter = true })<CR>", {})
		vim.api.nvim_set_keymap("n", "<leader>ti", ":lua require('neotest').summary.toggle()<CR>", {})
		vim.api.nvim_set_keymap("n", "<leader>tR", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", {})
		vim.api.nvim_set_keymap("n", "<leader>[n", ":lua require('neotest').jump.prev({ status = 'failed' })<CR>", {})
		vim.api.nvim_set_keymap("n", "<leader>]n", ":lua require('neotest').jump.next({ status = 'failed' })<CR>", {})
		vim.api.nvim_set_keymap("n", "<leader>td", ":lua require('neotest').run.run({strategy = 'dap'})<CR>", {})
	end,
}
