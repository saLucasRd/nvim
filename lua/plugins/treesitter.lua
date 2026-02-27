return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() 
      local configs = require("nvim-treesitter")

      configs.setup({
        ensure_installed = { 
            "lua", "vim", "vimdoc", "query", "javascript", 
            "html", "css", "python", "bash", "java" 
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<A-o>",
          node_incremental = "<A-o>",
          scope_incremental = "<A-O>",
          node_decremental = "<A-i>",

        },
      })
    end
  }
}
