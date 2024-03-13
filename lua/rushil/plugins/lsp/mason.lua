return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- Import mason
		local mason = require("mason")

		-- Import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		-- Import mason-tool-installer
		local mason_tool_installer = require("mason-tool-installer")

		-- Enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- Setup mason-lspconfig to ensure installation of language servers
		mason_lspconfig.setup({
			-- List of language servers for mason to ensure installation
			ensure_installed = {
				"bashls",  -- Bash
				"cssls",  -- CSS
				"dockerls",  -- Docker
				"docker_compose_language_service",  -- Docker Compose
				"gopls",  -- Go
				"html",  -- HTML
				"helm_ls",  -- Helm
				"jsonls",  -- JSON
				"tsserver",  -- JavaScript / TypeScript
				"lua_ls",  -- Lua
				"autotools_ls",  -- Make
				"marksman",  -- Markdown
				"rust_analyzer",  -- Rust
				"sqls",  -- SQL
				"taplo",  -- TOML
				"tailwindcss",  -- Tailwind CSS
				"lemminx",  -- XML
				"yamlls",  -- YAML
			},
			-- Auto-install configured servers with lspconfig
			automatic_installation = true,
		})

		-- Setup mason-tool-installer to ensure installation of tools/formatters
		mason_tool_installer.setup({
			-- List of tools/formatters for mason to ensure installation
			ensure_installed = {
				"prettierd",  -- Prettier formatter
				"stylua",  -- Lua formatter
				"black",  -- Python formatter
				"isort",  -- Python formatter
				"shfmt", -- Shell script formatter
				"gofumpt", -- Go formatter
				"goimports-reviser", -- Go formatter
				"golines", -- Go formatter
				"sqlfluff", -- SQL linter and formatter
				"golangci-lint", -- Go linter
				"xmlformatter", -- XML formatter
				"eslint_d", -- JavaScript linter
				"markdownlint", -- Markdown linter
				"shellcheck", -- Shell script linter
				"yamllint", -- YAML linter
			},
		})
	end,
}
