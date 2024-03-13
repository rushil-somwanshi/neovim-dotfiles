return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		-- Setup catppuccin plugin
		require("catppuccin").setup({
			flavour = "mocha",
			integrations = {
				alpha = true,
				fidget = false,
				gitsigns = true,
				harpoon = true,
				indent_blankline = {
					enabled = true,
					scope_color = "", -- Blank to use default text color
					colored_indent_levels = false,
				},
				mason = true,
				cmp = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
				treesitter = true,
				telescope = {
					enabled = true,
				},
				lsp_trouble = false,
				which_key = true,
			},
		})
		-- Set color scheme
		vim.cmd.colorscheme("catppuccin")
	end,
}
