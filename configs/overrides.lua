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
    extended_mode = true,
  },
  mathup = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",
    "clangd",
    "prettier",
    "bash-language-server",
    "gopls",
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
  extensions_list = { "themes", "terms", "projects", "fzf", "file_browser" },
}

M.gitsigns = {
  current_line_blame = true,
}

return M
