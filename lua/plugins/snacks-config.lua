return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		dim = { enabled = true },
		image = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		toggle = { enabled = true },
		zen = { enabled = true },
	},
	keys = {
		{ "<leader>nd", function() Snacks.notifier.hide() end, desc = "[N]otifications: [d]ismiss all" },
		{ "<leader>nh", function() Snacks.notifier.show_history() end, desc = "[N]otifications: show [h]istory" },
		{ "<leader>z", function() Snacks.zen() end, desc = "Toggle [z]en mode" },
	},
}
