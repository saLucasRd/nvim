vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smartindent = true

vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.opt.pumheight = 10

-- testing
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.smoothscroll = true
-- vim.opt.lazyredraw = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8

vim.opt.updatetime = 50
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus"

vim.opt.colorcolumn = "100"
vim.opt.signcolumn = "yes"

vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.showbreak = "↪"

vim.opt.list = true
vim.opt.listchars = {
	tab = "» ",
	trail = "·",
	nbsp = "␣",
	extends = "→",
	precedes = "←",
}
