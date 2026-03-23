return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			vim.keymap.set("n", "<leader>ha", function()
				harpoon:list():add()
			end, { desc = "Add File" })

			vim.keymap.set("n", "<leader>hh", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Toggle Menu" })

			vim.keymap.set("n", "<C-1>", function()
				harpoon:list():select(1)
			end, { desc = "Harpoon: Slot 1" })
			vim.keymap.set("n", "<C-2>", function()
				harpoon:list():select(2)
			end, { desc = "Harpoon: Slot 2" })
			vim.keymap.set("n", "<C-3>", function()
				harpoon:list():select(3)
			end, { desc = "Harpoon: Slot 3" })
			vim.keymap.set("n", "<C-4>", function()
				harpoon:list():select(4)
			end, { desc = "Harpoon: Slot 4" })
		end,
	},
}
