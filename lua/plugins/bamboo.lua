return
{
	'ribru17/bamboo.nvim',
	lazy = false,
	priority = 1000,
	config = function()
		require('bamboo').setup {
			style = 'vulgaris',
			term_colors = true,
		}
		require('bamboo').load()
	end,
}
