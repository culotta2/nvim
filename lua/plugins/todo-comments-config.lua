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
}
