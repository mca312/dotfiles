return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    preset = 'modern',
    win = {
      border = 'rounded', -- none, single, double, rounded, solid, shadow
      no_overlap = 'false',
      padding = { 2, 2, 2, 2 },
    },
    layout = {
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
    },
    keys = {
      scroll_down = '<c-d>',
      scroll_up = '<c-u>',
    },
  },
  config = function(_, opts)
    local wk = require 'which-key'
    wk.setup(opts)

    -- Leader key mappings
    wk.add {
      { '<leader>b', group = 'Buffer' },
      { '<leader>d', group = 'Diagnostics/Debug' },
      { '<leader>g', group = 'Git' },
      { '<leader>s', group = 'Search' },
      { '<leader>w', group = 'Window/Workspace' },
      { '<leader>x', group = 'Trouble/Fixes' },
    }
    -- Add nvim-surround keybindings
    wk.add {
      { 'ys', desc = 'Surround with...' },
      { 'yss', desc = 'Surround line with...' },
      { 'yS', desc = 'Surround with new lines...' },
      { 'cs', desc = 'Change surrounding...' },
      { 'ds', desc = 'Delete surrounding...' },
    }

    -- Visual mode mappings
    wk.add {
      { 'S', desc = 'Surround selection with...', mode = 'v' },
      { 'gS', desc = 'Surround selection with new lines...', mode = 'v' },
    }
  end,
}
