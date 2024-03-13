return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters = {
				sqlfluff = {
					command = "sqlfluff",
					args = {
						"format",
						"--dialect=postgres",
						"-",
					},
					stdin = true,
				},
			},
			formatters_by_ft = {
				css = { "prettierd" },
				go = { "goimports-reviser", "gofumpt", "golines" },
				html = { "prettierd" },
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				json = { "prettierd" },
				lua = { "stylua" },
				markdown = { "prettierd" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
				sh = { "shfmt" },
				sql = { "sqlfluff" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				xml = { "xmlformat" },
				yaml = { "prettierd" },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 3000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 3000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
