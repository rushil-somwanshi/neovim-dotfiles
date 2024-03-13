return {
	"hrsh7th/nvim-cmp",
	version = false, -- Last release is way too old
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer", -- Source for text in buffer
		"hrsh7th/cmp-path", -- Source for file system paths
		"L3MON4D3/LuaSnip", -- Snippet engine
		"saadparwaiz1/cmp_luasnip", -- For autocompletion
		"rafamadriz/friendly-snippets", -- Useful snippets
		"onsails/lspkind.nvim", -- VSCode-like pictograms
		{ "roobert/tailwindcss-colorizer-cmp.nvim", config = true }, -- TailwindCSS colorizer
	},
	config = function()
		-- Require cmp plugin
		local cmp = require("cmp")

		-- Require luasnip for snippets
		local luasnip = require("luasnip")

		-- Require lspkind for VSCode-like pictograms
		local lspkind = require("lspkind")

		-- Load snippets from VSCode-style plugins
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Define highlighting for CMP border and documentation
		vim.cmd("hi CmpBorder guibg=none guifg=#89b4fa")
		vim.cmd("hi CmpDocBorder guibg=none guifg=#89b4fa")

		-- Function to create border characters with specified highlighting
		local function border(hl_name)
			return {
				{ "╭", hl_name },
				{ "─", hl_name },
				{ "╮", hl_name },
				{ "│", hl_name },
				{ "╯", hl_name },
				{ "─", hl_name },
				{ "╰", hl_name },
				{ "│", hl_name },
			}
		end

		-- Setup CMP
		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			window = {
				completion = {
					col_offset = -3, -- Align the abbr and word on cursor (due to fields order below)
					winhighlight = "Normal:CmpPmenu,Search:None",
					border = border("CmpBorder"),
				},
				documentation = {
					border = border("CmpDocBorder"),
					winhighlight = "Normal:CmpDoc",
				},
			},
			snippet = { -- Configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- Next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll documentation up
				["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll documentation down
				["<C-Space>"] = cmp.mapping.complete(), -- Show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- Close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }), -- Confirm selection
			}),
			-- Sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- LSP sources
				{ name = "luasnip" }, -- Snippets
				{ name = "buffer" }, -- Text within current buffer
				{ name = "path" }, -- File system paths
			}),
			-- Configure lspkind for VSCode-like pictograms in completion menu
			formatting = {				
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
					show_labelDetails = true,
					before = require("tailwindcss-colorizer-cmp").formatter,
				}),
			},
		})
	end,
}