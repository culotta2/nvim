return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",

	---@module "blink.cmp"
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "default",
			['<C-l>'] = {'snippet_forward', 'fallback'},
			['<C-h>'] = {'snippet_backward', 'fallback'},
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono"
		},

		signature= { enabled = true },

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
	opts_extend = { "sources.default" }
}
