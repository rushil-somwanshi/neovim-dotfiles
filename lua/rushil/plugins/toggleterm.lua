return {
	-- Plugin specification
	"akinsho/toggleterm.nvim",
	version = "*",  -- Use any version of the plugin

	config = function()
		-- Require toggleterm and setup configuration
		require("toggleterm").setup({
			open_mapping = [[<C-\>]],  -- Key mapping to open toggleterm
			direction = "float",  -- Open toggleterm in floating window
			float_opts = {
				border = "curved",  -- Set border style for floating window
			},
		})
	end,
}
