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
  rainbow = {
    enable = true,
    query = 'rainbow-parens',
  },
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
    "pyright",

    -- format
    "prettier",
    "shfmt",
    "stylua",
    "gofumpt",
    "clang-format",
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
  },
  extensions_list = {
    "themes",
    "terms",
    "projects",
    "fzf",
    "frecency",
    "aerial",
    "zoxide",
  },
}

M.gitsigns = {
  current_line_blame = true,
}

M.blankline = {
  show_trailing_blankline_indent = true,
  show_first_indent_level = true,
  space_char_blankline = " ",
}

return M
