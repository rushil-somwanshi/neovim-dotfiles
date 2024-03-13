return {
	"NvChad/nvim-colorizer.lua",
	opts = {
		filetypes = {
			'*'; -- Highlight all files, but customize some others.
			"!cmp_menu", -- Do not highlight tailwindcss intellisense dropdowns
		  },
		user_default_options = {
			tailwind = true,
		},
	},
}

