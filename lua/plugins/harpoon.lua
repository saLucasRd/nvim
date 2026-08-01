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

			for i = 1, 4 do
				vim.keymap.set("n", string.format("<M-%d>", i), function()
					harpoon:list():select(i)
				end, { desc = "Harpoon Slot " .. i })
			end
		end,
	},
}
