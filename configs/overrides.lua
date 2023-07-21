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
    "gofumpt",
    "clang-format",
  },
}

-- cmp
local compare = require "cmp.config.compare"
compare.lsp_scores = function(entry1, entry2)
  local diff
  if entry1.completion_item.score and entry2.completion_item.score then
    diff = (entry2.completion_item.score * entry2.score) - (entry1.completion_item.score * entry1.score)
  else
    diff = entry2.score - entry1.score
  end
  return (diff < 0)
end
local cmp = require "cmp"

M.cmp = {
  preselect = cmp.PreselectMode.Item,
  sorting = {
    priority_weight = 2,
    comparators = {
      compare.offset, -- Items closer to cursor will have lower priority
      compare.exact,
      -- compare.scopes,
      compare.lsp_scores,
      compare.sort_text,
      compare.score,
      compare.recently_used,
      -- compare.locality, -- Items closer to cursor will have higher priority, conflicts with `offset`
      compare.kind,
      compare.length,
      compare.order,
    },
  },
  matching = {
    disallow_partial_fuzzy_matching = false,
  },
  performance = {
    async_budget = 1,
    max_view_entries = 150,
  },
  experimental = {
    ghost_text = {
      hl_group = "Whitespace",
    },
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
  use_treesitter = true,
}

return M
