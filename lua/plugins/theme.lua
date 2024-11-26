return {
	-- {
	--   "morhetz/gruvbox",
	--   config = function()
	--     vim.cmd.colorscheme("gruvbox")
	--   end,
	-- },
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				background = "hard", -- Options: "soft", "medium", "hard"
				transparent_background_level = 0, -- Adjust transparency as needed
				italics = false, -- Set to true if you want italics for keywords
				disable_italic_comments = false, -- Set to true to disable italics for comments
			})

			vim.cmd([[colorscheme everforest]])
		end,
	},
}
