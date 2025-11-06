-- Basic Neovim settings
require('core.options')
require('core.keymaps')

-- Lazy.nvim plugin manager
require('lazy-init')

-- Plugin configurations
require('plugins.catppuccin')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.lsp')
require('plugins.cmp')