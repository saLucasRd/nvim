vim.g.mapleader = " " -- leader key
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = "[F]ile [E]xplorer (Netrw)" })
vim.g.netrw_banner = 0         -- Remove o cabeçalho (instruções)
vim.g.netrw_liststyle = 3      -- Modo árvore (tree view)
vim.g.netrw_winsize = 25       -- Largura da lateral
