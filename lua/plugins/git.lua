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
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
					end

					map("]h", function()
						gs.nav_hunk("next")
					end, "Next Hunk")
					map("[h", function()
						gs.nav_hunk("prev")
					end, "Prev Hunk")

					map("<leader>Gs", gs.stage_hunk, "Stage Hunk")
					map("<leader>Gr", gs.reset_hunk, "Reset Hunk")
					map("<leader>GS", gs.stage_buffer, "Stage Buffer")
					map("<leader>Gp", gs.preview_hunk, "Preview Hunk")
					map("<leader>Gb", gs.toggle_current_line_blame, "Toggle Blame")
					map("<leader>Gd", gs.diffthis, "Diff This")
				end,
			})
		end,
	},

	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
}
