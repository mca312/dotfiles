-- Core editor keymaps (non-plugin specific)
local M = {}
local opts = { noremap = true, silent = true }

-- Navigation
M.setup_navigation = function()
  -- Keep cursor centered
  vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
  vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
  vim.keymap.set('n', 'n', 'nzzzv', opts)
  vim.keymap.set('n', 'N', 'Nzzzv', opts)
  vim.keymap.set('n', '<C-f>', '<C-f>zz', opts)
  vim.keymap.set('n', '<C-b>', '<C-b>zz', opts)
  vim.keymap.set('n', 'J', 'mzJ`z', opts)
  vim.keymap.set('n', '<C-j>', 'jzz', opts)
  vim.keymap.set('n', '<C-k>', 'kzz', opts)
  vim.keymap.set('n', '[m', '[mzz', opts)
  vim.keymap.set('n', ']m', ']mzz', opts)
  vim.keymap.set('n', '[M', '[Mzz', opts)
  vim.keymap.set('n', ']M', ']Mzz', opts)
end

-- Text editing
M.setup_editing = function()
  -- Delete without yanking
  vim.keymap.set('n', 'x', '"_x', opts)
  
  -- Save without auto commands
  vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)
  
  -- Preserve clipboard when pasting over selection
  vim.keymap.set('x', '<leader>p', '"_dP', opts)
  vim.keymap.set('v', 'p', '"_dP', opts)

  -- Move lines up and down
  vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
  vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)
  vim.keymap.set('v', '<A-j>', ':m .+1<CR>==', opts)
  vim.keymap.set('v', '<A-k>', ':m .-2<CR>==', opts)

  -- Stay in indent mode
  vim.keymap.set('v', '<', '<gv', opts)
  vim.keymap.set('v', '>', '>gv', opts)

  -- Clipboard operations
  vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], opts)
  vim.keymap.set('n', '<leader>Y', [["+Y]], opts)

  -- Replace word under cursor
  vim.keymap.set('n', '<leader>j', '*``cgn', opts)

  -- Quick exit from insert mode
  vim.keymap.set('i', 'jk', '<ESC>', opts)
  vim.keymap.set('i', 'kj', '<ESC>', opts)

  -- Increment/decrement numbers
  vim.keymap.set('n', '<leader>+', '<C-a>', opts)
  vim.keymap.set('n', '<leader>-', '<C-x>', opts)
end

-- Window management
M.setup_windows = function()
  -- Window splitting
  vim.keymap.set('n', '<leader>v', '<C-w>v', opts)      -- split window vertically
  vim.keymap.set('n', '<leader>h', '<C-w>s', opts)      -- split window horizontally
  vim.keymap.set('n', '<leader>se', '<C-w>=', opts)     -- make split windows equal width & height
  vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

  -- Resize with arrows
  vim.keymap.set('n', '<C-S-Up>', ':resize -2<CR>', opts)
  vim.keymap.set('n', '<C-S-Down>', ':resize +2<CR>', opts)
  vim.keymap.set('n', '<C-S-Left>', ':vertical resize -2<CR>', opts)
  vim.keymap.set('n', '<C-S-Right>', ':vertical resize +2<CR>', opts)
end

-- Buffer management
M.setup_buffers = function()
  -- Buffer navigation
  vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
  vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
  vim.keymap.set('n', '<leader>bn', '<cmd> enew <CR>', opts) -- new buffer
  vim.keymap.set('n', '<leader>bx', ':Bdelete!<CR>', opts)   -- close buffer
end

-- Tab management
M.setup_tabs = function()
  vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts)   -- open new tab
  vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
  vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts)     -- go to next tab
  vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts)     -- go to previous tab
end

-- Toggles and utilities
M.setup_toggles = function()
  -- Line wrapping toggle
  vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)
  
  -- Session management
  vim.keymap.set('n', '<leader>ss', ':mksession! .session.vim<CR>', { noremap = true, silent = false })
  vim.keymap.set('n', '<leader>sl', ':source .session.vim<CR>', { noremap = true, silent = false })
  
  -- Diagnostics toggle
  local diagnostics_active = true
  vim.keymap.set('n', '<leader>do', function()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
      vim.diagnostic.enable(true)
    else
      vim.diagnostic.enable(false)
    end
  end, opts)
end

-- Initialize all keymaps
M.setup_navigation()
M.setup_editing()
M.setup_windows()
M.setup_buffers()
M.setup_tabs()
M.setup_toggles()

return M