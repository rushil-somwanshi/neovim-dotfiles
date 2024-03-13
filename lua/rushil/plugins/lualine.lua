return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		{ "catppuccin/nvim", name = "catppuccin" },
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "", right = "" }, right_padding = 2 },
				},
				lualine_b = { "filename", "branch" },
				lualine_c = { "diff", "diagnostics" },
				lualine_x = {},
				lualine_y = { "filetype", "progress" },
				lualine_z = {
					{ "location", separator = { left = "", right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = { "trouble", "fugitive" },
		})
	end,
}
