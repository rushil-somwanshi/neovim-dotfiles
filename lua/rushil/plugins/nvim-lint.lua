return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- Configure linters by file type
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			python = { "pylint" },
			markdown = { "markdownlint" },
			go = { "golangcilint" },
			sh = { "shellcheck" },
			yaml = { "yamllint" },
		}

		-- Create autocmd group for linting
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		-- Define autocmd to trigger linting on buffer enter, write, and insert leave
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		-- Define key mapping to trigger linting for current file
		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
