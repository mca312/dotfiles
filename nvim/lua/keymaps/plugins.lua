-- nvim/lua/keymaps/plugins.lua
-- Plugin-specific keymaps
local M = {}
local opts = { noremap = true, silent = true }

-- Telescope keymaps
M.setup_telescope = function()
  local builtin = require 'telescope.builtin'

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
  vim.keymap.set('n', '<leader>e', ':Neotree toggle position=left<CR>', { silent = true, desc = 'Left File Explorer' })
  vim.keymap.set('n', '<leader>ngs', ':Neotree float git_status<CR>', { silent = true, desc = 'Neotree Open Git Status Window' })
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

-- Formatting keymaps
M.setup_formatting = function()
  vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format { async = true }
  end, { desc = 'Format file' })
end

-- Copilot keymaps
M.setup_copilot = function()
  vim.keymap.set('i', '<C-f>', 'copilot#Accept("<CR>")', { replace_keycodes = false, expr = true, silent = true, desc = 'Accept Copilot suggestion' })
  vim.keymap.set('i', '<C-j>', 'copilot#Accept("<C-n>")', { replace_keycodes = false, expr = true, silent = true, desc = 'Accept Copilot suggestion' })
end

-- Bufferline keymaps
M.setup_bufferline = function()
  -- These are commented out in your original config, but I'll include them for reference
  -- vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
  -- vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
  -- vim.keymap.set('n', '<leader>1', "<cmd>lua require('bufferline').go_to_buffer(1)<CR>", { desc = 'Go to Buffer 1' })
  -- vim.keymap.set('n', '<leader>2', "<cmd>lua require('bufferline').go_to_buffer(2)<CR>", { desc = 'Go to Buffer 2' })
  -- vim.keymap.set('n', '<leader>3', "<cmd>lua require('bufferline').go_to_buffer(3)<CR>", { desc = 'Go to Buffer 3' })
  -- vim.keymap.set('n', '<leader>4', "<cmd>lua require('bufferline').go_to_buffer(4)<CR>", { desc = 'Go to Buffer 4' })
  -- vim.keymap.set('n', '<leader>5', "<cmd>lua require('bufferline').go_to_buffer(5)<CR>", { desc = 'Go to Buffer 5' })
  -- vim.keymap.set('n', '<leader>6', "<cmd>lua require('bufferline').go_to_buffer(6)<CR>", { desc = 'Go to Buffer 6' })
  -- vim.keymap.set('n', '<leader>7', "<cmd>lua require('bufferline').go_to_buffer(7)<CR>", { desc = 'Go to Buffer 7' })
  -- vim.keymap.set('n', '<leader>8', "<cmd>lua require('bufferline').go_to_buffer(8)<CR>", { desc = 'Go to Buffer 8' })
  -- vim.keymap.set('n', '<leader>9', "<cmd>lua require('bufferline').go_to_buffer(9)<CR>", { desc = 'Go to Buffer 9' })
end

-- Diagnostic keymaps
M.setup_diagnostics = function()
  vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
  vim.keymap.set('n', '<leader>dj', function()
    vim.diagnostic.jump { count = 1, severity = { min = vim.diagnostic.severity.WARN } }
  end, { desc = 'Jump to next error' })
  vim.keymap.set('n', '<leader>dp', function()
    vim.diagnostic.jump { count = 1, severity = { min = vim.diagnostic.severity.WARN } }
  end, { desc = 'Jump to previous error' })

  -- Diagnostic toggle
  local diagnostics_active = true
  vim.keymap.set('n', '<leader>do', function()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
      vim.diagnostic.enable(true)
    else
      vim.diagnostic.enable(false)
    end
  end, { desc = 'Toggle diagnostics' })
end

-- DAP keymaps
M.setup_dap = function()
  vim.keymap.set('n', '<leader>db', require('dap').toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
  vim.keymap.set('n', '<leader>dB', function()
    require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
  end, { desc = 'Debug: Set Conditional Breakpoint' })
  vim.keymap.set('n', '<leader>dc', require('dap').continue, { desc = 'Debug: Start/Continue' })
  vim.keymap.set('n', '<leader>dC', require('dap').run_to_cursor, { desc = 'Debug: Run to Cursor' })
  vim.keymap.set('n', '<leader>dg', function()
    require('dap-go').debug_test()
  end, { desc = 'Debug: Go Test' })
  vim.keymap.set('n', '<leader>dk', require('dap').step_over, { desc = 'Debug: Step Over' })
  vim.keymap.set('n', '<leader>di', require('dap').step_into, { desc = 'Debug: Step Into' })
  vim.keymap.set('n', '<leader>do', require('dap').step_out, { desc = 'Debug: Step Out' })
  vim.keymap.set('n', '<leader>dl', require('dap').run_last, { desc = 'Debug: Run Last' })
  vim.keymap.set('n', '<leader>dr', require('dap').repl.open, { desc = 'Debug: Open REPL' })
  vim.keymap.set('n', '<leader>dq', require('dap').terminate, { desc = 'Debug: Terminate' })
  vim.keymap.set('n', '<leader>dR', require('dap').restart, { desc = 'Debug: Restart' })
  vim.keymap.set('n', '<leader>dh', function()
    require('dap.ui.widgets').hover()
  end, { desc = 'Debug: Hover Variables' })

  -- UI toggle
  vim.keymap.set('n', '<leader>du', function() require('dapui').toggle({ reset = true, layout = 'console' }) end, { desc = 'Debug: Toggle UI' })
end

M.setup_harpoon = function()
  local harpoon = require('harpoon')
  vim.keymap.set('n', '<leader>ha', function() harpoon:list():add() end, { desc = 'Add'})
  vim.keymap.set('n', '<leader>hl', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'List'} )

  vim.keymap.set('n', '<leader>h1', function() harpoon:list():select(1) end, { desc = '1'})
  vim.keymap.set('n', '<leader>h2', function() harpoon:list():select(2) end, { desc = '2'})
  vim.keymap.set('n', '<leader>h3', function() harpoon:list():select(3) end, { desc = '3'})
  vim.keymap.set('n', '<leader>h4', function() harpoon:list():select(4) end, { desc = '4'})

  vim.keymap.set('n', '<leader>hn', function() harpoon:list():next() end, { desc = 'Next'})
  vim.keymap.set('n', '<leader>hp', function() harpoon:list():prev() end, { desc = 'Prev'})
end

M.setup_go = function()
  local go = require('go')
  vim.keymap.set('n', '<leader>gdf', '<cmd>GoTestFunc<CR>', { desc = 'Test Function' })
end

-- Setup function for initializing plugin keymaps
M.setup = function()
  pcall(M.setup_telescope)
  pcall(M.setup_neotree)
  -- pcall(M.setup_comment)
  pcall(M.setup_trouble)
  pcall(M.setup_formatting)
  pcall(M.setup_copilot)
  pcall(M.setup_bufferline)
  pcall(M.setup_diagnostics)
  pcall(M.setup_dap)
  pcall(M.setup_harpoon)
  pcall(M.setup_go)
end

M.setup()
return M
