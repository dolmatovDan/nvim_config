return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		config = function()
			-- local lsp_zero = require("lsp-zero")
			-- lsp_zero.on_attach(function(client, bufnr)
			-- 	lsp_zero.default_keymaps({ buffer = bufnr })
			-- end)
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", opts)
					vim.keymap.set("n", "<leader>gd", "<CMD>lua vim.lsp.buf.definition()<CR>", opts)
					vim.keymap.set("n", "<leader>gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", opts)
					vim.keymap.set("n", "<leader>gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", opts)
					-- vim.keymap.set("n", "<leader>go", "<CMD>lua vim.lsp.buf.type_definition()<CR>", opts)
					vim.keymap.set("n", "<leader>gcr", "<CMD>lua vim.lsp.buf.references()<CR>", opts)
					vim.keymap.set("n", "<leader>gr", "<CMD>Telescope lsp_references<CR>", opts)

					-- vim.keymap.set("n", "<leader>gs", "<CMD>lua vim.lsp.buf.signature_help()<CR>", opts)
					vim.keymap.set("n", "<leader>rn", "<CMD>lua vim.lsp.buf.rename()<CR>", opts)
					-- vim.keymap.set(opts, "<F3>", "<CMD>lua vim.lsp.buf.format({async = true})<CR>", opts)
					vim.keymap.set("n", "<leader>ca", "<CMD>lua vim.lsp.buf.code_action()<CR>", opts)
					-- vim.keymap.set("n", "gl", "<CMD>lua vim.diagnostic.open_float()<CR>", opts)
					vim.keymap.set("n", "[d", "<CMD>lua vim.diagnostic.goto_prev()<CR>", opts)
					vim.keymap.set("n", "]d", "<CMD>lua vim.diagnostic.goto_next()<CR>", opts)
				end,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.solargraph.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.texlab.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.pylsp.setup({
				capabilities = capabilities,
			})
			lspconfig.kotlin_language_server.setup({
				cmd = { "kotlin-language-server" },
				filetypes = { "kotlin" },
				root_dir = require("lspconfig.util").root_pattern("build.gradle", "settings.gradle", ".git"),
			})
			-- lspconfig.csharp_ls.setup({
			-- 	capabilities = capabilities,
			-- })

			lspconfig.omnisharp.setup({
				cmd = {
					"/usr/local/bin/omnisharp-roslyn/OmniSharp",
					"--languageserver",
					"--hostPID",
					tostring(vim.fn.getpid()),
				},
				on_attach = function(client, bufnr)
					-- Настройте свои клавиши и другие параметры здесь
				end,
			})
		end,
	},
}
