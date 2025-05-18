return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		{
			"folke/lazydev.nvim",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
		-- Automatically install LSPs
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",

		-- Status updates for LSP
		{ "j-hui/fidget.nvim", opts = {} },

	},
	config = function()
		local lsp_group = vim.api.nvim_create_augroup("lsp_group", { clear = true })
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- Function to run when the LSP is attached
		vim.api.nvim_create_autocmd("LspAttach", {
			group = lsp_group,
			callback = function(args)
				-- LSP Keymaps
				vim.keymap.set("n", "gd", Snacks.picker.lsp_definitions,
					{ desc = "LSP: [G]oto [D]efinition" })
				vim.keymap.set("n", "gD", Snacks.picker.lsp_declarations,
					{ desc = "LSP: [G]oto [D]eclaration" })
				vim.keymap.set("n", "gr", Snacks.picker.lsp_references,
					{ desc = "LSP: [G]oto [R]eferences" })
				vim.keymap.set("n", "gI", Snacks.picker.lsp_implementations,
					{ desc = "LSP: [G]oto [I]mplementation" })
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover" })
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: Global [R]ename" })
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
					{ desc = "LSP: Code [A]ction" })
				vim.keymap.set("n", "<leader>sy", Snacks.picker.lsp_type_definitions,
					{ desc = "LSP: [G]oto T[y]pe Definitions" })
				vim.keymap.set("n", "<leader>ds", Snacks.picker.lsp_symbols,
					{ desc = "LSP: [D]ocument [S]ymbols" }
				)
				vim.keymap.set("n", "<leader>ws", Snacks.picker.lsp_workspace_symbols,
					{ desc = "LSP: [D]ocument [S]ymbols" }
				)
				vim.keymap.set(
					"n",
					"<leader>th",
					function()
						vim.lsp.inlay_hint.enable(
							not vim.lsp.inlay_hint.is_enabled()
						)
					end,
					{ desc = "LSP: [Toggle] inlay [H]ints" }
				)
			end,
		})

		-- Set up LSPs
		require("mason").setup()

		vim.lsp.enable({ "basedpyright", "marksman", "sqls", "tinymist", "lua_ls" })

		vim.lsp.config("basedpyright", {
			capabilities = capabilities,
		})
		vim.lsp.config("sqls", {
			capabilities = capabilities,
		})
		vim.lsp.config("marksman", {
			capabilities = capabilities,
		})
		vim.lsp.config("tinymist", {
			capabilities = capabilities,
			settings = {
				exportPdf = "onSave",
			}
		})
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					completion = {
						callsnippet = "Replace",
					},
					diagnostics = {
						disable = { "missing-fields" },
					}
				}
			}
		})
	end,
}
