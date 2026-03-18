return {
	{
		"nvim-tree/nvim-web-devicons",
		opts = { default = true },
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.o.background = "dark"
			vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "gruvbox",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				globalstatus = true,
			},
			sections = {
				lualine_b = {
					{
						"branch",
						fmt = function(str)
							if #str > 20 then
								return str:sub(1, 17) .. "..."
							end
							return str
						end,
					},
				},
			},
		},
	},
}
