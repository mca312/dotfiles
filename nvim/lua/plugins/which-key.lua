return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    preset = 'modern',
    win = {
      border = 'rounded', -- none, single, double, rounded, solid, shadow
      padding = { 2, 2, 2, 2 },
      wo = {
        winblend = 10, -- slight transparency
      },
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
      { '<leader>d', group = 'Diagnostics' },
      { '<leader>g', group = 'Git' },
      { '<leader>s', group = 'Search' },
      { '<leader>w', group = 'Window/Workspace' },
      { '<leader>x', group = 'Trouble/Fixes' },
    }
  end,
}
