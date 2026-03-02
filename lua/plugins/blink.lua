return {
	{
		"saghen/blink.cmp",
		event = "VimEnter",
		version = "v0.*",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					"rafamadriz/friendly-snippets",
				},
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
			"folke/lazydev.nvim",
		},

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "default",
				["<Tab>"] = { "snippet_forward", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },
			},

			appearance = {
				nerd_font_variant = "mono",
				kind_icons = {
					Text = "󰉿",
					Method = "󰆧",
					Function = "󰊕",
					Constructor = "",
					Field = "󰜢",
					Variable = "󰀫",
					Class = "󰠱",
					Interface = "󰁔",
					Module = "",
					Property = "󰜢",
					Unit = "󰑭",
					Value = "󰎟",
					Enum = "",
					Keyword = "󰌋",
					Snippet = "",
					Color = "󰏘",
					File = "󰈙",
					Reference = "󰈚",
					Folder = "󰉋",
					EnumMember = "",
					Constant = "󰏿",
					Struct = "󰙅",
					Event = "",
					Operator = "󰆕",
					TypeParameter = "󰅲",
				},
			},

			completion = {
				ghost_text = { enabled = true },
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},

				menu = {
					draw = {
						columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
					},
				},
			},

			sources = {
				default = { "lsp", "path", "snippets", "lazydev" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},

			snippets = { preset = "luasnip" },

			fuzzy = {
				implementation = "prefer_rust_with_warning",
				prebuilt_binaries = { download = true },
			},

			signature = { enabled = true },
		},
	},
}
