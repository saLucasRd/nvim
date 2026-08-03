return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            intelephense = {
                filetypes = { "php", "blade", "php_only" },
                settings = {
                    intelephense = {
                        files = {
                            associations = { "*.php", "*.blade.php" },
                            maxSize = 5000000,
                        },
                        environment = {
                            includePaths = { "vendor" },
                            phpVersion = "8.2", -- Ajuste para a versão do seu projeto Laravel
                        },
                    },
                },
            },

            phpactor = {
                filetypes = { "php" },
                init_options = {
                    ["language_server_phpstan.enabled"] = false,
                    ["language_server_psalm.enabled"] = false,
                }
            },
       },
    },
}
