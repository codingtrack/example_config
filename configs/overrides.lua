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
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  matchup = { enable = true },
}

M.mason = {
  ensure_installed = {
    -- lsp
    "lua-language-server",
    "clangd",
    "bash-language-server",
    "gopls",
    "marksman",
    "jsonnet-language-server",
    "neocmakelsp",
    "yaml-language-server",
    "jedi-language-server",

    -- format
    "prettier",
    "shfmt",
    "stylua",
    "golines",
    "clang-format",
    "black"
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
}

M.telescope = {
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    frecency = {
      show_scores = true,
      show_unindexed = true,
      ignore_patterns = { "*.git/*", "*/tmp/*" },
    },
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
    },
    undo = {
      side_by_side = true,
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
  watch_gitdir = { interval = 1000, follow_files = true },
  current_line_blame = true,
  current_line_blame_opts = { delay = 1000, virtual_text_pos = "eol" },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  word_diff = false,
  diff_opts = { internal = true },
}

M.blankline = {
  show_trailing_blankline_indent = true,
  show_first_indent_level = true,
  space_char_blankline = " ",
  context_patterns = {
    "^if",
    "^table",
    "block",
    "class",
    "for",
    "function",
    "if_statement",
    "import",
    "list_literal",
    "method",
    "selector",
    "type",
    "var",
    "while",
  },
  -- use_treesitter = true,
}

return M
