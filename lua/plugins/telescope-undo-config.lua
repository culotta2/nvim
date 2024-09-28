return {
	"debugloop/telescope-undo.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope.nvim",
			opts = {},
			dependencies = { "nvim-lua/plenary.nvim" },
		},
	},
	keys = {
		{ "<leader>fu", "<CMD>Telescope undo<CR>", mode = "n", desc = "[F]ind in [U]ndo tree" },
		{ "<leader>ft", "<CMD>TodoTelescope<CR>", mode = "n", desc = "[F]ind [T]odos" },
	},
	config = function()
		require("telescope").load_extension("undo")
		-- -- Keymaps
		-- vim.keymap.set("n", "<leader>fu", "<cmd>Telescope undo<CR>", { desc = "[F]ind in [U]ndo tree" })
		-- vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>")
	end,
}
