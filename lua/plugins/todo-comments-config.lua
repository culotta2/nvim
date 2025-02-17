return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		keywords = {
			TODO = { alt = { "todo", "unimplemented" } },
		},
		highlight = {
			pattern = {
				[[.*<(KEYWORDS)\s*:]],
				[[.*<(KEYWORDS)\s*!\(]],
			},
			comments_only = false,
		},
		search = {
			pattern = [[\b(KEYWORDS)(:|!\()]],
		},
	},
	keys = {
		{ "<leader>st", function() Snacks.picker.todo_comments() end, desc = "[S]earch [t]odos" },
		{ "<leader>sT", function() Snacks.picker.todo_comments({
			keywords = { "TODO", "FIX", "FIXME", "PERF" },
		}) end, desc = "[S]earch [t]odos" },
	}
}
