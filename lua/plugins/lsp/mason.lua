return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = { "jdtls", "google-java-format", "stylua" },
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
				"pyright",
				"clangd",
			},
		},
	},
}
