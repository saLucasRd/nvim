return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto", 
				globalstatus = true, 
				component_separators = { left = "│", right = "│" },
				section_separators = { left = "", right = "" },

				icons_enabled = true,
			},
			sections = {
				-- Left Side
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { 
					"diff",
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " ", hint = " " }
					},
					{ "filename", path = 0 } 
				},

				-- Right Side
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			-- Integrations to make Lualine play nice with your other plugins
			extensions = { "lazy", "mason", "fzf", "nvim-tree" },
		})
	end,
}
