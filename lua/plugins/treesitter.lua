return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter")
			configs.setup({
				ensure_installed = {
					"lua", "vim", "vimdoc", "query", "javascript",
					"html", "css", "python", "bash",
					"c", "cpp", "php", "tlaplus",
				},
				auto_install = true,
				sync_install = false,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				incremental_selection = {
					enable = true,
				},
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "*",
				callback = function()
					pcall(vim.treesitter.start)
				end,
			})
		end
	}
}
