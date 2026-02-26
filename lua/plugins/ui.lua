return {
	{
		'nvim-tree/nvim-web-devicons', opts = { default = true }
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
				theme = 'gruvbox-material', 
				section_separators = '', 
				component_separators = '|' }
			}
		},
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			opts = {}
		},
		{
			"folke/todo-comments.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
			opts = {}
		},
	}


