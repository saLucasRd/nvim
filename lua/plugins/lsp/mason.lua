return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"jdtls",
				"lua_ls",
				"pyright",
				"clangd",
			},
		},
	},
}
