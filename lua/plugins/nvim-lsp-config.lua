return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",

		-- Visuals
		-- "onsails/lspkind.nvim",

		-- Status updates for LSP
		{ "j-hui/fidget.nvim", opts = {} },

		-- Additional lua configuration
		{ "folke/neodev.nvim", opts = {} },

		-- Autocomplete
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		-- "L3MON4D3/LuaSnip",
		-- "saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local lsp_group = vim.api.nvim_create_augroup("lsp_group", { clear = true })
		local builtin = require("telescope.builtin")

		-- Function to run when the LSP is attached
		vim.api.nvim_create_autocmd('LspAttach', {
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

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
		local servers = {
			based_pyright = {},
			rust_analyzer = {},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callsnippet = "Replace",
						},
						diagnostics = { disable = { "missing-fields" }},
					}
				}
			},
		}
		require("mason").setup()
		require('mason-lspconfig').setup {
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend(
						'force', {}, capabilities, server.capabilities or {}
					)
					require('lspconfig')[server_name].setup(server)
				end,
			},
		}
	end,
}
