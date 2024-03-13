return {
	"tpope/vim-fugitive",
	config = function()
		-- For conciseness, aliasing vim.keymap to keymap
		local keymap = vim.keymap

		keymap.set("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git status" })
		keymap.set("n", "<leader>gd", "<cmd>Gvdiff<cr>", { desc = "Git diff" })
		keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "Git blame" })
	end,
}
