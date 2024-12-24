return {
  'github/copilot.vim',
  event = 'VeryLazy',
  config = function()
    vim.g.copilot_enabled = 1
    vim.g.copilot_no_tab_map = true

    vim.keymap.set('i', '<C-f>', 'copilot#Accept("<CR>")', { replace_keycodes = false, expr = true, silent = true, desc = 'Accept Copilot suggestion' })
    vim.keymap.set('i', '<C-j>', 'copilot#Accept("<C-n>")', { replace_keycodes = false, expr = true, silent = true, desc = 'Accept Copilot suggestion' })
  end,
}
