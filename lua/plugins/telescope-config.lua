return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	build = "make",
	dependencies = { 
		"nvim-lua/plenary.nvim",
		{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
	},
	config = function()
		require("telescope").setup()
		local builtin = require("telescope.builtin")

		-- Keymaps
		vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "[F]ind [H]elp" })
		vim.keymap.set("n", "<leader>fk", require("telescope.builtin").keymaps, { desc = "[F]ind [K]eymaps" })
		vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[F]ind [F]iles" })
		vim.keymap.set("n", "<leader>fw", require("telescope.builtin").grep_string, { desc = "[F]ind current [W]ord" })
		vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "[F]ind by [G]rep" })
		vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = "[F]ind [D]iagnostics" })
		vim.keymap.set("n", "<leader>fr", require("telescope.builtin").resume, { desc = "[R]esume last search" })
		vim.keymap.set("n", "<leader>f?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
		vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "[F]ind [B]uffers" })
		vim.keymap.set("n", "<leader>fc", function()
			builtin.find_files ({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[F]ind [C]onfig files" })
	end
}
