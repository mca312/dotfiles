-- nvim/lua/plugins/which-key.lua
return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    local which_key = require('which-key')
    
    which_key.setup({
      plugins = {
        marks = true,       -- shows marks when pressing '
        registers = true,   -- shows registers when pressing " in NORMAL or <C-r> in INSERT
        spelling = {
          enabled = false,  -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions to show
        },
        presets = {
          operators = true,    -- adds help for operators like d, y, ...
          motions = true,      -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true,      -- default bindings on <c-w>
          nav = true,          -- misc bindings to work with windows
          z = true,            -- bindings for folds, spelling, etc. starting with z
          g = true,            -- bindings for prefixed with g
        },
      },
      icons = {
        breadcrumb = "»",   -- symbol used in the command line area that shows your active key combo
        separator = "➜",    -- symbol used between a key and its label
        group = "+",        -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = '<c-d>', -- binding to scroll down inside the popup
        scroll_up = '<c-u>',   -- binding to scroll up inside the popup
      },
      window = {
        border = "rounded",     -- none, single, double, shadow
        position = "bottom",    -- bottom, top
        margin = { 1, 0, 1, 0 }, -- [top, right, bottom, left] padding for the popup window
        padding = { 2, 2, 2, 2 }, -- the same as above, for the floating window
        winblend = 0,            -- value between 0-100, 0 for fully opaque, 100 for fully transparent
      },
      layout = {
        height = { min = 4, max = 25 },  -- min and max height of the columns
        width = { min = 20, max = 50 },  -- min and max width of the columns
        spacing = 3,                      -- spacing between columns
        align = "left",                   -- align columns left, center or right
      },
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
      ignore_missing = false,             -- enable this to hide mappings for which you didn't specify a label
      show_help = true,                   -- show help message on the command line when the popup is visible
      show_keys = true,                   -- show the key that was pressed
      triggers = "auto",                  -- automatically setup triggers
      triggers_blacklist = {
        i = { "j", "k" },                -- disable triggering in insert mode to avoid conflicts
        v = { "j", "k" },
      },
      -- Disabled until keybindings are established
      disable = {
        buftypes = {},
        filetypes = { "TelescopePrompt" },
      },
    })

    -- Register key groups
    which_key.register({
      ["<leader>"] = {
        b = { name = "Buffer" },
        c = { name = "Code/LSP" },
        d = { name = "Diagnostics" },
        f = { "Format file" },
        g = { name = "Git" },
        l = { name = "Line options" },
        n = { name = "Neo-Tree" },
        r = { name = "Rename" },
        s = { name = "Search/Session" },
        t = { name = "Tabs" },
        w = { name = "Workspace/Window" },
        x = { name = "Trouble/Diagnostics" },
      },
    })

    -- LSP specific bindings
    which_key.register({
      g = {
        name = "Goto",
        d = "Definition",
        D = "Declaration",
        r = "References",
        I = "Implementation",
      },
      ["<leader>"] = {
        c = {
          name = "Code",
          a = "Code Action",
          l = "LSP references/definitions",
          s = "Symbols",
        },
        d = {
          name = "Diagnostics",
          d = "Show diagnostic float",
          j = "Jump to next error",
          b = "Jump to previous error",
          o = "Toggle diagnostics",
          s = "Document symbols",
        },
        r = {
          name = "Rename",
          n = "Rename symbol",
        },
        w = {
          name = "Workspace",
          a = "Add workspace folder",
          r = "Remove workspace folder",
          l = "List workspace folders",
          s = "Workspace symbols",
        },
      },
    })
  end,
}