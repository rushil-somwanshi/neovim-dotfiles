return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",  -- Branch specification
	dependencies = {
		-- Required dependencies
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },  -- Telescope FZF native extension
		"nvim-tree/nvim-web-devicons",  -- Icons for Telescope

	},
	config = function()
		-- Require Telescope and actions modules
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		-- Setup Telescope defaults
		telescope.setup({
			defaults = {
				path_display = { "truncate " },  -- Display truncated path
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,  -- Move to previous result
						["<C-j>"] = actions.move_selection_next,  -- Move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,  -- Send selected to quickfix list
					},
				},
			},
		})

		-- Load FZF extension for Telescope
		telescope.load_extension("fzf")

		-- For conciseness, aliasing vim.keymap to keymap
		local keymap = vim.keymap

		-- Define key mappings with descriptions
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in current working directory" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in current working directory" })
		keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Fuzzy find files in git repository" })
		keymap.set("n", "<leader>fd", "<cmd>Telescope git_status<cr>", { desc = "List current changes per file with diff preview and add action" })
	end,
}
