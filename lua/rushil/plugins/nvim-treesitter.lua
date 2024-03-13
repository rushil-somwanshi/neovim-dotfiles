return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				-- Bash
				"bash",
				-- Comment
				"comment",
				-- CSS
				"css",
				-- CSV
				"csv",
				-- Docker
				"dockerfile",
				-- Go
				"go",
				"gomod",
				"gowork",
				"gosum",
				-- HTML
				"html",
				-- JavaScript
				"javascript",
				-- JSON
				"json",
				-- Lua
				"lua",
				"luadoc",
				-- Make
				"make",
				-- Markdown
				"markdown",
				"markdown_inline",
				-- Regex
				"regex",
				-- Rust
				"rust",
				-- SQL
				"sql",
				-- TOML
				"toml",
				-- TypeScript
				"typescript",
				"tsx",
				-- Vim
				"vim",
				"vimdoc",
				-- XML
				"xml",
				-- YAML
				"yaml",
			},
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			autotag = {
				enable = true,
			},
		})
	end,
}
