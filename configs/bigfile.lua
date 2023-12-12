return function()
  local cmp = {
    name = "nvim-cmp",
    opts = { defer = true },
    disable = function()
      require("cmp").setup.buffer { enabled = false }
    end,
  }

  local wilder = {
    name = "wilder",
    opts = { defer = true },
    disable = function()
      require("wilder").disable()
    end,
  }

  require("bigfile").config {
    filesize = 1, -- size of the file in MiB
    pattern = { "*" }, -- autocmd pattern
    features = { -- features to disable
      "indent_blankline",
      "lsp",
      "illuminate",
      "treesitter",
      "syntax",
      "vimopts",
      "filetype",
      "matchparen",
      cmp,
      -- wilder,
    },
  }
end
