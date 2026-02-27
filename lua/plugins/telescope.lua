return {
	{
		'nvim-telescope/telescope.nvim',
		version = '*',
		event = 'VimEnter',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
			'nvim-telescope/telescope-ui-select.nvim',
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			local telescope = require('telescope')
			local builtin = require('telescope.builtin')

			telescope.setup({
				defaults = {
					path_display = { "truncate" },
					file_ignore_patterns = { "node_modules", ".git/", "dist/" },
					layout_config = {
						horizontal = { preview_width = 0.5 },
					},
				},
				pickers = {
					find_files = { theme = "dropdown", previewer = false },
					help_tags = { theme = "ivy" },
					buffers = { theme = "dropdown", previewer = false, initial_mode = "insert" }
				},
				extensions = {
					['ui-select'] = { require('telescope.themes').get_dropdown() }
				}
			})

			pcall(require('telescope').load_extension, 'fzf')
			pcall(telescope.load_extension, 'ui-select')

			vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
			vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]ile' })
			vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
			vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch [W]ord under cursor'})

			-- docs
			vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
			vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
			vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })

			vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

			vim.keymap.set('n', '<leader>sn', function()
				builtin.find_files({ cwd = vim.fn.stdpath('config') })
			end, { desc = '[S]earch [N]eovim files' })

			vim.keymap.set('n', '<leader>/', function()
				builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
					winblend = 10,
					previewer = false,
				})
			end, { desc = '[/] Fuzzily search in current buffer' })

		end,
	}
}
