return {
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "-", "<cmd>Yazi<cr>", desc = "Open yazi at current file" },
			{ "<leader>ew", "<cmd>Yazi cwd<cr>", desc = "Open yazi in cwd" },
		},
		opts = {
			open_for_directories = true,
			floating_window_scaling_factor = 0.9,
			yazi_floating_window_border = "rounded",
		},
	},
}
