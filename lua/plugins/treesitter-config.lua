return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects"
	},
	build = ':TSUpdate',
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"python",
			"r",
			"rust",
			"vim",
			"vimdoc",
		},
		-- Autoinstall languages that are not installed
		auto_install = true,
		sync_install = true,
		highlight = {
			enable = true,
			-- additional_vim_regex_highlighting = { "python" },
		},
		-- indent = { enable = true, disable = { "python" } },
		indent = { enable = true },
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["aa"] = "@parameter.outer",
					["ia"] = "@parameter.inner",
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
					["ii"] = "@conditional.inner",
					["ai"] = "@conditional.outer",
					["il"] = "@loop.inner",
					["al"] = "@loop.outer",
					["at"] = "@comment.outer",
				}
			},
			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					["]f"] = "@function.outer",
					["]]"] = "@class.outer",
				},
				goto_next_end = {
					["]F"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[f"] = "@function.outer",
					["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[F"] = "@function.outer",
					["[]"] = "@class.outer",
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>pa"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>pA"] = "@parameter.inner",
				},
			},
		}
	},
}
