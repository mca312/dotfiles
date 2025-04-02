-- nvim/lua/keymaps/plugins.lua
-- Plugin-specific keymaps
local M = {}
local opts = { noremap = true, silent = true }

-- Telescope keymaps
M.setup_telescope = function()
  local builtin = require('telescope.builtin')
  
  vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
  vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch existing [B]uffers' })
  vim.keymap.set('n', '<leader>sm', builtin.marks, { desc = '[S]earch [M]arks' })
  vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
  vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Search [G]it [C]ommits' })
  vim.keymap.set('n', '<leader>gcf', builtin.git_bcommits, { desc = 'Search [G]it [C]ommits for current [F]ile' })
  vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Search [G]it [B]ranches' })
  vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Search [G]it [S]tatus (diff view)' })
  vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
  vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
  vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
  vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
  vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
  vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]resume' })
  vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
  vim.keymap.set('n', '<leader>sds', function()
    builtin.lsp_document_symbols {
      symbols = { 'Class', 'Function', 'Method', 'Constructor', 'Interface', 'Module', 'Property' },
    }
  end, { desc = '[S]each LSP document [S]ymbols' })
  vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
  vim.keymap.set('n', '<leader>s/', function()
    builtin.live_grep {
      grep_open_files = true,
      prompt_title = 'Live Grep in Open Files',
    }
  end, { desc = '[S]earch [/] in Open Files' })
  vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      previewer = false,
    })
  end, { desc = '[/] Fuzzily search in current buffer' })
end

-- Neo-Tree keymaps
M.setup_neotree = function()
  vim.keymap.set('n', '<leader>w', ':Neotree toggle float<CR>', { silent = true, desc = 'Float File Explorer' })
  vim.keymap.set('n', '<leader>e', ':Neotree toggle position=left<CR>', { silent = true, desc = 'Left File Explorer' })
  vim.keymap.set('n', '<leader>ngs', ':Neotree float git_status<CR>', { silent = true, desc = 'Neotree Open Git Status Window' })
  vim.keymap.set('n', '\\', ':Neotree reveal<CR>', { silent = true, desc = 'Reveal file in Neotree' })
end

-- Formatting keymaps
M.setup_formatting = function()
  vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format { async = true }
  end, { desc = 'Format file' })
end

-- Comment.nvim keymaps
M.setup_comment = function()
  local comment_api = require('Comment.api')
  vim.keymap.set('n', '<C-_>', comment_api.toggle.linewise.current, opts)
  vim.keymap.set('n', '<C-c>', comment_api.toggle.linewise.current, opts)
  vim.keymap.set('n', '<C-/>', comment_api.toggle.linewise.current, opts)
  vim.keymap.set('v', '<C-_>', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
  vim.keymap.set('v', '<C-c>', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
  vim.keymap.set('v', '<C-/>', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
end

-- Trouble.nvim keymaps
M.setup_trouble = function()
  vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Diagnostics (Trouble)' })
  vim.keymap.set('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { desc = 'Buffer Diagnostics (Trouble)' })
  vim.keymap.set('n', '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', { desc = 'Symbols (Trouble)' })
  vim.keymap.set('n', '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', { desc = 'LSP Definitions / references / ... (Trouble)' })
  vim.keymap.set('n', '<leader>xL', '<cmd>Trouble loclist toggle<cr>', { desc = 'Location List (Trouble)' })
  vim.keymap.set('n', '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', { desc = 'Quickfix List (Trouble)' })
end

-- Copilot keymaps
M.setup_copilot = function()
  vim.keymap.set('i', '<C-f>', 'copilot#Accept("<CR>")', { replace_keycodes = false, expr = true, silent = true, desc = 'Accept Copilot suggestion' })
  vim.keymap.set('i', '<C-j>', 'copilot#Accept("<C-n>")', { replace_keycodes = false, expr = true, silent = true, desc = 'Accept Copilot suggestion' })
end

-- Setup function for initializing plugin keymaps
M.setup = function()
  pcall(M.setup_telescope)
  pcall(M.setup_neotree)
  pcall(M.setup_formatting)
  pcall(M.setup_comment)
  pcall(M.setup_trouble)
  pcall(M.setup_copilot)
end

M.setup()
return M