return {
	{ -- This plugin
		"Zeioth/makeit.nvim",
		cmd = { "MakeitOpen", "MakeitToggleResults", "MakeitRedo" },
		dependencies = { "stevearc/overseer.nvim" },
		opts = {},
		config = function()
			require("makeit").setup({})
			vim.keymap.set("n", "<leader>mt", ":MakeitToggleResults<CR>", {})
			vim.keymap.set("n", "<leader>mo", ":MakeitOpen<CR>", {})
			vim.keymap.set("n", "<leader>mr", ":MakeitRedo<CR>", {})
			vim.keymap.set("n", "<leader>ms", ":MakeitStop<CR>", {})
		end,
	},
	{ -- The task runner we use
		"stevearc/overseer.nvim",
		commit = "400e762648b70397d0d315e5acaf0ff3597f2d8b",
		cmd = { "MakeitOpen", "MakeitToggleResults", "MakeitRedo" },
		opts = {
			task_list = {
				direction = "bottom",
				min_height = 10,
				max_height = 10,
				default_detail = 1,
			},
		},
	},
}
