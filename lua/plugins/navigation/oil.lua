return {
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        float = {
          padding = 2,
          max_width = 90,
          max_height = 0,
          border = "rounded", -- Options: "none", "single", "double", "rounded"
          win_options = {
            winblend = 0,
          },
        },
      })

      vim.keymap.set("n", "-", function() require("oil").toggle_float() end, 
        { desc = "Open parent directory in floating window" })
    end,
  },
}
