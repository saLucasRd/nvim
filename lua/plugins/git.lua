return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require('gitsigns').setup({
				signs = {
					add          = { text = '+' },
					change       = { text = '~' },
					delete       = { text = '-' },
					topdelete    = { text = '‾' },
					changedelete = { text = '~' },
				},
			})

			local gs = require('gitsigns')
		end
	},

	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "[G]it: [D]iff View Open" })
			vim.keymap.set("n", "<leader>gq", "<cmd>DiffviewClose<cr>", { desc = "[G]it: [Q]uit Diff View" })
		end
	}
}
