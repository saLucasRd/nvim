return {

	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate',
		config = function()
			local configs = require('nvim-treesitter.config')
			configs.setup({
				ensure_installed = {
					"lua", "vim", "vimdoc", "query", "javascript",
					"html", "css", "python", "bash", "java"
				},
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_hihlighting = false,
				},
				indent = { enable = true },
			})
		end
	}
}
