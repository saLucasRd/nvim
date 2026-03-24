return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			local toggleterm = require("toggleterm")

			toggleterm.setup({
				size = 15, -- Altura do terminal estilo VS Code
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				shade_terminals = true,
				start_in_insert = true,
				persist_size = true,
				direction = "horizontal", -- PADRÃO agora é horizontal (estilo VS Code)
				close_on_exit = true,
				shell = vim.o.shell,
			})

			local Terminal = require("toggleterm.terminal").Terminal

			-- 1. Instância Flutuante para Lazygit
			local lazygit = Terminal:new({
				cmd = "lazygit",
				direction = "float", -- Força ser flutuante
				hidden = true,
				float_opts = { border = "curved" },
			})

			-- 2. Instância Flutuante para Lazydocker
			local lazydocker = Terminal:new({
				cmd = "lazydocker",
				direction = "float", -- Força ser flutuante
				hidden = true,
				float_opts = { border = "curved" },
			})

			-- 3. Terminal Normal (Estilo VS Code)
			-- Como o padrão no setup acima é 'horizontal', não precisamos forçar aqui
			local vsc_term = Terminal:new({
				direction = "horizontal",
				hidden = true,
			})

			-- Funções de Toggle
			local function toggle_lg()
				lazygit:toggle()
			end
			local function toggle_ld()
				lazydocker:toggle()
			end
			local function toggle_vsc()
				vsc_term:toggle()
			end

			-- Atalhos
			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<leader>tt", toggle_vsc, { desc = "Terminal (VS Code Style)" })
			vim.keymap.set("n", "<leader>tg", toggle_lg, { desc = "Lazygit (Float)" })
			vim.keymap.set("n", "<leader>td", toggle_ld, { desc = "Lazydocker (Float)" })

			-- Esc Duplo para não ficar preso
			vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Sair do modo terminal" })
		end,
	},
}
