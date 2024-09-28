return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
			default_file_explorer = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
				natural_order = true,
			},
	},
	keys = {
		{ "-", "<CMD>Oil<CR>", mode="n", desc="Open Parent Directory" },
	}
}
