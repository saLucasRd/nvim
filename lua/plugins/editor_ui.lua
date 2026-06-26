return {
	{
		"nvim-tree/nvim-web-devicons",
		opts = { default = true },
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("kanagawa-wave")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "kanagawa",
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
