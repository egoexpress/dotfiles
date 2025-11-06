-- Basic Neovim options

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- Appearance
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"

-- Mouse
vim.opt.mouse = "a"

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Case sensitivity
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Undo
vim.opt.undofile = true

-- Update time
vim.opt.updatetime = 50

-- Completion
vim.opt.completeopt = "menuone,noselect"

-- Wildmenu
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"