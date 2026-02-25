return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            java = { "google-java-format" },
            lua = { "stylua" },
            javascript = { "prettier" },
            html = { "prettier" },
        },
        format_on_save = { timeout_ms = 500, lsp_fallback = true },
    },
}
