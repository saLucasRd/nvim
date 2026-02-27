return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function() 
			local configs = require("nvim-treesitter")

			configs.setup({
				ensure_installed = { 
					"lua", "vim", "vimdoc", "query", "javascript", 
					"html", "css", "python", "bash", "java" 
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					--keymaps = {
					--	init_selection = "gnn",
					--	node_incremental = "grn",
					--	scope_incremental = "grc",
					--	node_decremental = "grm",

					--},
				},
			})
		end
	}
}
