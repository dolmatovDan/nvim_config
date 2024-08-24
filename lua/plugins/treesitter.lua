return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				ensure_installed = {
					"bash",
					"c",
					"cpp",
					"glsl",
					"haskell",
					"hlsl",
					"latex",
					"lua",
					"make",
					"python",
					"rust",
				},
			})
		end,
	},
}
