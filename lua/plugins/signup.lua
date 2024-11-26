return {
	"Dan7h3x/signup.nvim",
	branch = "main",
	config = function()
		require("signup").setup({
			win = nil,
			buf = nil,
			timer = nil,
			visible = false,
			current_signatures = nil,
			enabled = false,
			-- enabled = true,
			normal_mode_active = false,
			config = {
				silent = false,
				number = true,
				icons = {
					parameter = " ",
					method = " ",
					documentation = " ",
				},
				colors = {
					parameter = "#86e1fc",
					method = "#c099ff",
					documentation = "#4fd6be",
				},
				active_parameter_colors = {
					bg = "#86e1fc",
					fg = "#1a1a1a",
				},
				border = "solid",
				winblend = 10,
			},
			toggle_key = "<C-l>",
		})
	end,
}
