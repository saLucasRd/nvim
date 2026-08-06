vim.g.mapleader = " " -- leader key
vim.g.maplocalleader = " "
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = 'Clear search highlight', silent = true }) -- limpar highlight de busca

vim.keymap.set("n", "<leader>w", "<cmd>w<CR>" , { desc = 'Quick Save'})
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = 'Exec'}, { silent = true }) -- exec
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = 'Replace'}) -- replace


