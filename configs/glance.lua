return function()
  local actions = require("glance").actions

  require("glance").setup {
    height = 20,
    zindex = 50,
    preview_win_opts = {
      cursorline = true,
      number = true,
      wrap = true,
    },
    border = {
      enable = require("core.settings").transparent_background,
      top_char = "―",
      bottom_char = "―",
    },
    list = {
      position = "right",
      width = 0.33, -- 33% width relative to the active window, min 0.1, max 0.5
    },
    folds = {
      folded = true, -- Automatically fold list on startup
    },
    indent_lines = { enable = true },
    winbar = { enable = true },
    mappings = {
      list = {
        ["k"] = actions.previous,
        ["j"] = actions.next,
        ["<Up>"] = actions.previous,
        ["<Down>"] = actions.next,
        ["<S-Tab>"] = actions.previous_location, -- Bring the cursor to the previous location skipping groups in the list
        ["<Tab>"] = actions.next_location, -- Bring the cursor to the next location skipping groups in the list
        ["<C-u>"] = actions.preview_scroll_win(8),
        ["<C-d>"] = actions.preview_scroll_win(-8),
        ["<CR>"] = actions.jump,
        ["v"] = actions.jump_vsplit,
        ["s"] = actions.jump_split,
        ["t"] = actions.jump_tab,
        ["c"] = actions.close_fold,
        ["o"] = actions.open_fold,
        ["[]"] = actions.enter_win "preview", -- Focus preview window
        ["q"] = actions.close,
        ["Q"] = actions.close,
        ["<Esc>"] = actions.close,
        ["gq"] = actions.quickfix,
      },
      preview = {
        ["Q"] = actions.close,
        ["<C-c>q"] = actions.close,
        ["<C-c>o"] = actions.jump,
        ["<C-c>v"] = actions.jump_vsplit,
        ["<C-c>s"] = actions.jump_split,
        ["<C-c>t"] = actions.jump_tab,
        ["<C-p>"] = actions.previous_location,
        ["<C-n>"] = actions.next_location,
        ["[]"] = actions.enter_win "list", -- Focus list window
      },
    },
  }
end
