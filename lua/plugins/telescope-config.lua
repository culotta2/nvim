return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	build = "make",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
	},
	opts = {},
	keys = {
		{ "<leader>fh", require("telescope.builtin").help_tags, mode = "n", desc = "[F]ind [H]elp" },
		{ "<leader>fk", require("telescope.builtin").keymaps, mode = "n", desc = "[F]ind [K]eymaps" },
		{ "<leader>ff", require("telescope.builtin").find_files, mode = "n", desc = "[F]ind [F]iles" },
		{ "<leader>fw", require("telescope.builtin").grep_string, mode = "n", desc = "[F]ind current [W]ord" },
		{ "<leader>fg", require("telescope.builtin").live_grep, mode = "n", desc = "[F]ind by [G]rep" },
		{ "<leader>fd", require("telescope.builtin").diagnostics, mode = "n", desc = "[F]ind [D]iagnostics" },
		{ "<leader>fr", require("telescope.builtin").resume, mode = "n", desc = "[R]esume last search" },
		{ "<leader>f?", require("telescope.builtin").oldfiles, mode = "n", desc = "[?] Find recently opened files" },
		{ "<leader>fb", require("telescope.builtin").buffers, mode = "n", desc = "[F]ind [B]uffers" },
		{
			"<leader>fc",
			function ()
				require("telescope.builtin").find_files ({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "[F]ind [C]onfig files"
		},
	},
}
