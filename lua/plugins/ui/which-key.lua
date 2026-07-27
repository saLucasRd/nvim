return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.add({
				-- Groups
				{ "<leader>d", group = "Diagnostics", icon = "" },
				{ "<leader>h", group = "Harpoon", icon = "" },
				{ "<leader>s", group = "Search", icon = "" },
				{ "<leader>g", group = "Go to", icon = "" },
				{ "<leader>c", group = "Code", icon = "" },
				{ "<C-g>", group = "Git", icon = "" },

				{ "<leader><leader>", desc = "Find Buffers" },
				{ "<leader>/", desc = "Fuzzy Search Buffer" },
			})
		end,
	},
}
