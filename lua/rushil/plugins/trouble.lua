return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>xq", function()
			require("trouble").toggle("quickfix")
		end)
	end,
}
