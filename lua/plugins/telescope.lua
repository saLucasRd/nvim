return {
	{
		'nvim-telescope/telescope.nvim', version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- optional but recommended
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		config = function()

			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]ile' })
			vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch  [W]ord'})
			-- vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Git [P]roject' })
		end,
	}
}
