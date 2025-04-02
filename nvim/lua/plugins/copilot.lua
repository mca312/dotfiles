return {
  'github/copilot.vim',
  event = 'VeryLazy',
  config = function()
    vim.g.copilot_enabled = 1
    vim.g.copilot_no_tab_map = true

  end,
}