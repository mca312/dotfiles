-- keymaps/init.lua
-- Main file to load all keymaps modules

-- Global leader key setup
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Load all keybinding modules
require('keymaps.core')     -- Core editor keymaps
require('keymaps.plugins')  -- Plugin keymaps  
require('keymaps.lsp')      -- LSP keymaps