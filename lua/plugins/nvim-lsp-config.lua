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

		-- Visuals
		-- "onsails/lspkind.nvim",

		-- Status updates for LSP
		{ "j-hui/fidget.nvim", opts = {} },

		-- Autocomplete
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		-- "L3MON4D3/LuaSnip",
		-- "saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local lsp_group = vim.api.nvim_create_augroup("lsp_group", { clear = true })
		local builtin = require("telescope.builtin")
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- Function to run when the LSP is attached
		vim.api.nvim_create_autocmd("LspAttach", {
			group = lsp_group,
			callback = function(args)
				-- LSP Keymaps
				vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "LSP: [G]oto [D]efinition" })
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: [G]oto [D]eclaration" })
				vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "LSP: [G]oto [R]eferences" })
				vim.keymap.set("n", "gI", builtin.lsp_implementations, { desc = "LSP: [G]oto [I]mplementation" })
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover" })
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: Global [R]ename" })
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code [A]ction" })
				vim.keymap.set("n", "<leader>D", builtin.lsp_type_definitions, { desc = "LSP: [T]ype definition" })
				vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols,
					{ desc = "LSP: [D]ocument [S]ymbols" }
				)
				vim.keymap.set("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols,
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
		require("mason-lspconfig").setup({})

		-- Lua
		require("lspconfig").lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					completion = {
						callsnippet = "Replace",
					},
					diagnostics = { disable = { "missing-fields" }},
				}
			}
		})
		-- Python
		require("lspconfig").basedpyright.setup({
			capabilities = capabilities,
		})

		-- Rust analyzer
		require("mason-lspconfig").setup_handlers {
			["rust_analyzer"] = function() end,
		}

		-- SQL
		require("lspconfig").sqls.setup({
			capabilities = capabilities,
		})

		-- Markdown
		require("lspconfig").marksman.setup({
			capabilities = capabilities,
		})

		-- Typst
		require("lspconfig").tinymist.setup({
			capabilities = capabilities,
			settings = {
				exportPdf = "onSave", -- onType, never
			}
		})
	end,
}
