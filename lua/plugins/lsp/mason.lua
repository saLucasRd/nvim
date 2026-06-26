return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = { "stylua", "php-cs-fixer", "codelldb" },
		},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"basedpyright",
				"clangd",
				"intelephense",
			},
		},
	},
}
