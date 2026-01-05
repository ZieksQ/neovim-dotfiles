return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "modern",

			transparent_bg = false,

			transparent_cursorline = true,

			-- color groups using color name or hex values
			hi = {
				error = "DiagnosticError", -- Highlight for error diagnostics
				warn = "DiagnosticWarn", -- Highlight for warning diagnostics
				info = "DiagnosticInfo", -- Highlight for info diagnostics
				hint = "DiagnosticHint", -- Highlight for hint diagnostics
				arrow = "NonText", -- Highlight for the arrow pointing to diagnostic
				background = "CursorLine", -- Background highlight for diagnostics
				mixing_color = "Normal", -- Color to blend background with (or "None")
			},

			-- file types to disabled plugins.
			disabled_ft = {},

			options = {
				use_icon_from_diagnostric = false,
				set_arrow_to_diag_color = false,

				throttle = 20,
				softwrap = 30,

				add_message = {
					message = true,
					display_count = false,
					use_max_severity = false,
					show_multiple_glyphs = true,
				},

				multilines = { enabled = false },

				show_all_diags_on_cursorline = false,
				show_diags_only_under_cursor = true,

				enable_on_insert = false,
				enable_on_select = false,

				overflow = {
					mode = "wrap",
					padding = 0,
				},
			},
		})
		vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
	end,
}
