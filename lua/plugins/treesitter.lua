return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-treesitter.config").setup({
            ensure_installed = { 
                "bash", "c", "css", "cpp", "go", "html", "java", "javascript", 
                "json", "lua", "markdown", "markdown_inline", "python", "rust", 
                "tsx", "typescript", "php",
            },
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        })
    end
}
