return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp", 
    },
    opts = {
        -- This is where you declare your servers. 
        servers = {
            lua_ls = {}, 
			html = {},
			cssls = {},
			ts_ls = {},
        }, 
    },
    config = function(_, opts)
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(opts.servers or {}),
        })
        local lspconfig = require("lspconfig")
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        for server, config in pairs(opts.servers or {}) do
            config.capabilities = capabilities
            lspconfig[server].setup(config)
        end
    end,
}
