return {
    "adibhanna/laravel.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim", 
        "nvim-treesitter/nvim-treesitter",
        "tpope/vim-dotenv",
        "MunifTanjim/nui.nvim",
    },
    cmd = { "Laravel" },
    keys = {
        { "<leader>la", "<cmd>Laravel artisan<CR>", desc = "Laravel Artisan" },
        { "<leader>lr", "<cmd>Laravel routes<CR>", desc = "Laravel Routes" },
    },
    config = function()
        require("laravel").setup({
            features = {
                route_info = { enable = true },
                artisan = { enable = true },
            },
        })
    end,
}
