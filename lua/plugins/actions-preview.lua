return {
	"aznhe21/actions-preview.nvim",
	event = "VeryLazy",
	-- lazy = false,
	config = function()
		vim.keymap.set({ "v", "n" }, "<leader>ca", require("actions-preview").code_actions)
	end,
}
