return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"theHamsta/nvim-dap-virtual-text",
			"nvim-lua/plenary.nvim",
		},
		lazy = true,
		config = function()
			local dap = require("dap")

			require("dap").set_log_level("DEBUG")
			local Path = require("plenary.path")
			local install_dir = Path:new(vim.fn.stdpath("data"), "mason"):absolute()

			dap.adapters.netcoredbg = {
				type = "executable",
				command = install_dir .. "/packages/netcoredbg/netcoredbg", -- Full path to netcoredbg
				args = { "--interpreter=vscode" },
			}
			dap.configurations.cs = {
				{
					type = "netcoredbg",
					name = "Launch file",
					request = "launch",
					program = function()
						return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
				},
			}

			dap.adapters.gdb = {
				type = "executable",
				command = "gdb", -- Ensure gdb is installed and available in your PATH
				args = { "--quiet", "--interpreter=dap" },
			}

			dap.configurations.c = {
				{
					name = "Run executable (GDB)",
					type = "gdb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}", -- Current working directory
					stopOnEntry = false,
					args = {}, -- Arguments passed to the program
				},
				{
					name = "Run executable with arguments (GDB)",
					type = "gdb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = function()
						local args_str = vim.fn.input("Arguments: ")
						return vim.split(args_str, " +")
					end,
				},
				{
					name = "Attach to process (GDB)",
					type = "gdb",
					request = "attach",
					processId = require("dap.utils").pick_process,
				},
			}
			require("nvim-dap-virtual-text").setup({})

			vim.keymap.set("n", "<F1>", function()
				dap.continue()
			end, { desc = "Continue debugging" })

			vim.keymap.set("n", "<F2>", function()
				dap.step_into()
			end, { desc = "Step into" })

			vim.keymap.set("n", "<F3>", function()
				dap.step_over()
			end, { desc = "Step over" })

			vim.keymap.set("n", "<F4>", function()
				dap.step_out()
			end, { desc = "Step out" })

			vim.keymap.set("n", "<F5>", function()
				dap.step_back()
			end, { desc = "Step out" })

			vim.keymap.set("n", "<F6>", function()
				dap.terminate()
			end, { desc = "Stop debugging" })

			vim.keymap.set("n", "<F7>", function()
				dap.repl.open()
			end, { desc = "Open REPL" })

			vim.keymap.set("n", "<leader>dc", function()
				dap.run_to_cursor()
			end, { desc = "Run debugging to cursor" })

			vim.keymap.set("n", "<leader>db", function()
				dap.toggle_breakpoint()
			end, {
				desc = "Toggle Debug breakpoint",
			})

			vim.keymap.set("n", "<leader>dB", function()
				local condition = vim.fn.input("Breakpoint condition: ")
				dap.set_breakpoint(condition)
			end, {
				desc = "Toggle Debug conditional Breakpoint",
			})
			vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
		end,
	},
}
