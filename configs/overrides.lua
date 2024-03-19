local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "javascript",
    "typescript",
    "c",
    "cpp",
    "go",
    "python",
    "markdown",
    "markdown_inline",
    "bash",
    "vimdoc",
    "cmake",
    "make",
    "diff",
    "yaml",
    "proto",
    "ini",
    "json",
    "xml",
    "html",
    "ninja",
    "regex",
    "sql",
    "gpg",
    "gitcommit",
    "git_config",
    "git_rebase",
  },
  highlight = {
    enable = true,
    disable = function(ft, bufnr)
      if vim.tbl_contains({ "vim" }, ft) then
        return true
      end

      local ok, is_large_file = pcall(vim.api.nvim_buf_get_var, bufnr, "bigfile_disable_treesitter")
      return ok and is_large_file
    end,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
}

M.mason = {
  ensure_installed = {
    -- lsp
    "lua-language-server",
    "clangd",
    "bash-language-server",
    "gopls",
    "marksman",
    "json-lsp",
    "yaml-language-server",
    "pyright",
    "cmake-language-server",

    -- format
    "prettier",
    "shfmt",
    "stylua",
    "gofumpt",
    "clang-format",
    "black",
  },
}

M.cmp = {
  matching = {
    disallow_partial_fuzzy_matching = false,
  },
  performance = {
    async_budget = 1,
    max_view_entries = 120,
  },
  sorting = {
    priority_weight = 2,
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
  update_focused_file = {
    update_root = true,
  },
}

M.telescope = {
  extensions = {
    fzf = {
      fuzzy = false, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    frecency = {
      show_scores = false,
      show_unindexed = true,
      ignore_patterns = { "*.git/*", "*/tmp/*" },
    },
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
    },
    undo = {
      side_by_side = true,
    },
    aerial = {
      show_lines = false,
      show_nesting = {
        ["_"] = false, -- This key will be the default
        lua = true, -- You can set the option for specific filetypes
      },
    },
  },
  extensions_list = {
    "themes",
    "terms",
    "projects",
    "fzf",
    "frecency",
    "aerial",
    "zoxide",
    "undo",
  },
}

M.gitsigns = {
  signs = {
    add = {
      hl = "GitSignsAdd",
      numhl = "GitSignsAddNr",
      linehl = "GitSignsAddLn",
    },
    change = {
      hl = "GitSignsChange",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
    delete = {
      hl = "GitSignsDelete",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
    },
    topdelete = {
      hl = "GitSignsDelete",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
    },
    changedelete = {
      hl = "GitSignsChange",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
  },
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  attach_to_untracked = true,
  watch_gitdir = { interval = 1000, follow_files = true },
  current_line_blame = true,
  current_line_blame_opts = { virt_text = true, delay = 1000, virt_text_pos = "eol" },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  diff_opts = { internal = true },
  on_attach = function()
  end,

}

M.indent_blankline = {
  indent = { smart_indent_cap = true, priority = 2 },
  exclude = {
    filetypes = {
      "", -- for all buffers without a file type
      "alpha",
      "big_file_disabled_ft",
      "dashboard",
      "dotooagenda",
      "flutterToolsOutline",
      "fugitive",
      "git",
      "gitcommit",
      "help",
      "json",
      "log",
      "markdown",
      "NvimTree",
      "aerial",
      "peekaboo",
      "startify",
      "TelescopePrompt",
      "todoist",
      "txt",
      "undotree",
      "vimwiki",
      "vista",
    },
    buftypes = { "terminal", "nofile", "quickfix", "prompt" },
  },
}

return M
