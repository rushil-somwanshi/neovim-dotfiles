return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		-- For conciseness, aliasing vim.keymap to keymap
		local keymap = vim.keymap

		keymap.set("n", "<leader>a", mark.add_file, { desc = "Mark file with Harpoon" })
		keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Toggle quick menu to list all marked files" })
		keymap.set("n", "<C-h>", function()
			ui.nav_file(1)
		end, { desc = "Navigate to Harpoon marked file 1" })
		keymap.set("n", "<C-j>", function()
			ui.nav_file(2)
		end, { desc = "Navigate to Harpoon marked file 2" })
		keymap.set("n", "<C-k>", function()
			ui.nav_file(3)
		end, { desc = "Navigate to Harpoon marked file 3" })
		keymap.set("n", "<C-l>", function()
			ui.nav_file(4)
		end, { desc = "Navigate to Harpoon marked file 4" })
	end,
}