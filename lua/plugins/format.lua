return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            php = { "pint" }, -- Perfeito para Laravel!
            javascript = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },
}
