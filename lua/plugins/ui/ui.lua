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
		{
			"HiPhish/rainbow-delimiters.nvim",
			dependencies = "nvim-treesitter/nvim-treesitter",
			config = function()
				local rainbow_delimiters = require 'rainbow-delimiters'

				require('rainbow-delimiters.setup').setup {
					strategy = {
						[''] = rainbow_delimiters.strategy['global'],
					},
					query = {
						[''] = 'rainbow-delimiters',
					},
					highlight = {
						'RainbowDelimiterRed',
						'RainbowDelimiterYellow',
						'RainbowDelimiterBlue',
						'RainbowDelimiterOrange',
						'RainbowDelimiterGreen',
						'RainbowDelimiterViolet',
						'RainbowDelimiterCyan',
					},
				}
			end,
		},
	}


