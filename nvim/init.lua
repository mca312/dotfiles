require 'core.options'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
	if vim.v.shell_error ~= 0 then
		error('Error cloning lazy.nvim:\n' .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
	require 'plugins.neotree',
	require 'plugins.colortheme',
	require 'plugins.bufferline',
	require 'plugins.lualine',
	require 'plugins.treesitter',
	require 'plugins.telescope',
	require 'plugins.lsp',
	require 'plugins.dap',
	require 'plugins.autocompletion',
	require 'plugins.none-ls',
	require 'plugins.gitsigns',
	require 'plugins.alpha',
	require 'plugins.indent-blankline',
	require 'plugins.misc',
	require 'plugins.copilot',
	require 'plugins.trouble',
	require 'plugins.markdown',
	require 'plugins.comment',
	require 'plugins.which-key',
	require 'plugins.surround',
	require 'plugins.harpoon',
	require 'plugins.go'
}

require 'keymaps'

vim.cmd.colorscheme 'catppuccin'

require('catppuccin').setup {
	flavour = 'mocha',
	default_integrations = true,
	integrations = {
		nvimtree = true,
	},
}
