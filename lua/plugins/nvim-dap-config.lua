return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"folke/neodev.nvim",
		"rcarriga/nvim-dap-ui",
		-- DAPs
		"mfussenegger/nvim-dap-python",
		"nvim-neotest/nvim-nio"
	},

	config = function()
		require("neodev").setup({
			library = { plugins = { "nvim-dap-ui" }, types = true }
		})

		require("dapui").setup()

		-- Configure dapui to toggle when dap is initialized or terminated
		local dap, dapui = require("dap"), require("dapui")

		-- Toggle dapui on open
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		-- Toggle dapui on completion
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		-- Toggle dapui on exit
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- Specific DAPs

		-- Python
		require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

		-- Rust
		dap.adapters.lldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = "/home/dom/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb",
				args = { "--port", "${port}" },
			},
		}

		dap.configurations.rust = {
			{
				name = "Launch file",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		-- Keymaps
		vim.keymap.set("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Dap toggle [b]reakpoint" })
		vim.keymap.set("n", "<leader>dc", function() require("dap").continue() end, { desc = "Dap [c]ontinue" })
		vim.keymap.set("n", "<leader>di", function() require("dap").step_into() end, { desc = "Dap step [i]nto" })
		vim.keymap.set("n", "<leader>do", function() require("dap").step_over() end, { desc = "Dap step [o]ver" })
		vim.keymap.set("n", "<leader>dq", function() require("dap").terminate() end, { desc = "Dap [t]erminate" })
		vim.keymap.set("n", "<leader>dr", function() require("dap").repl.open() end, { desc = "Dap open [r]epl" })
		vim.keymap.set("n", "<leader>du", function() require("dap").step_out() end, { desc = "Dap step out ([u]pper)" })
		vim.keymap.set("n", "<leader>dB", function()
			require("dap").set_breakpoint(vim.fn.input("Breakpoint Condition: "))
			end, { desc = "Dap toggle conditional [b]reakpoint" })
		vim.keymap.set("n", "<leader>dl", function()
			require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end, { desc = "Dap [l]og point message" })

	end
}
