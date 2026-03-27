return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "-" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				diff_opts = {
					ignore_whitespace = true,
				},
				on_attach = function(bufnr)
					local gs = require("gitsigns")
					local function map(mode, l, r, desc)
						vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
					end

					-- 1. Navigation (Crucial for jumping between changes)
					map("n", "]h", function()
						gs.nav_hunk("next")
					end, "Next Hunk")
					map("n", "[h", function()
						gs.nav_hunk("prev")
					end, "Prev Hunk")

					-- 2. The Essentials (What you actually use daily)
					map("n", "<C-g>p", gs.preview_hunk, "Preview Hunk")
					map("n", "<C-g>r", gs.reset_hunk, "Reset Hunk")
					map("n", "<C-g>b", gs.toggle_current_line_blame, "Toggle Blame")
					map("n", "<C-g>d", gs.diffthis, "Diff This File")
				end,
			})
		end,
	},

	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<C-g>v", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
		},
	},
}
