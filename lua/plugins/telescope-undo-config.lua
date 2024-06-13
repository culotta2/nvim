return {
	"debugloop/telescope-undo.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("undo")

		-- Keymaps
		vim.keymap.set("n", "<leader>fu", "<cmd>Telescope undo<CR>", { desc = "[F]ind in [U]ndo tree" })
		vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>")
	end,
}
