local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        -- event = { "CursorHold", "CursorHoldI" },
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "p00f/nvim-ts-rainbow",
    },
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      {
        "ahmedkhalf/project.nvim",
        event = "VimEnter",
        config = function()
          require("project_nvim").setup {
            detection_methods = { "pattern" },
            patterns = { ".git", ".svn", ".clang-format", "package.json", ".hgtags" },
          }
        end,
      },
      {
        "nvim-telescope/telescope-file-browser.nvim",
      },
      {
        "nvim-telescope/telescope-frecency.nvim",
        dependencies = { "kkharji/sqlite.lua" },
      },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    opts = overrides.telescope,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = overrides.gitsigns,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "TimUntersberger/neogit",
    cmd = { "Neogit" },
    dependencies = { "sindrets/diffview.nvim", cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" } },
    config = function()
      require("neogit").setup {
        integrations = { diffview = true },
        disable_commit_confirmation = true,
        disable_builtin_notifications = true,
      }
    end,
  },
  {
    "utilyre/barbecue.nvim",
    event = "LspAttach",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      -- "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
      -- create_autocmd = false,
      attach_navic = false,
      -- show_basename = false,
      -- show_dirname = false,
    },
  },
  {
    "gelguy/wilder.nvim",
    event = "CmdlineEnter",
    config = function()
      local wilder = require "wilder"
      wilder.setup { modes = { ":", "/", "?" } }

      local popupmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
        border = "rounded",
        empty_message = wilder.popupmenu_empty_message_with_spinner(),
        highlighter = wilder.basic_highlighter(),
        left = {
          " ",
          wilder.popupmenu_devicons(),
          wilder.popupmenu_buffer_flags {
            flags = " a + ",
            icons = { ["+"] = "", a = "", h = "" },
          },
        },
        right = {
          " ",
          wilder.popupmenu_scrollbar(),
        },
      })

      local wildmenu_renderer = wilder.wildmenu_renderer {
        highlighter = wilder.basic_highlighter(),
        separator = " · ",
      }

      wilder.set_option(
        "renderer",
        wilder.renderer_mux {
          [":"] = popupmenu_renderer,
          ["/"] = wildmenu_renderer,
          substitute = wildmenu_renderer,
        }
      )
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufReadPost",
    config = function()
      require("nvim-lastplace").setup {
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
        lastplace_open_folds = true,
      }
    end,
  },
  {
    "windwp/nvim-spectre",
    cmd = { "Spectre" },
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "phaazon/hop.nvim",
    lazy = true,
    cmd = { "HopWord", "HopLine" },
    config = function()
      require("hop").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },
  {
    "junegunn/vim-easy-align",
    cmd = { "EasyAlign" },
    lazy = true,
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      dofile(vim.g.base46_cache .. "notify")
      require("notify").setup()
      vim.notify = require "notify"
    end,
  },
  {
    "LunarVim/bigfile.nvim",
    event = { "BufReadPost", "BufReadPre", "BufRead" },
    config = function()
      local ftdetect = {
        name = "ftdetect",
        opts = { defer = true },
        disable = function()
          vim.api.nvim_set_option_value("filetype", "big_file_disabled_ft", { scope = "local" })
        end,
      }

      local cmp = {
        name = "nvim-cmp",
        opts = { defer = true },
        disable = function()
          require("cmp").setup.buffer { enabled = false }
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
          ftdetect,
          cmp,
        },
      }
    end,
  },
  {
    "michaelb/sniprun",
    build = "bash install.sh",
    cmd = { "SnipRun" },
  },
  {
    "karb94/neoscroll.nvim",
    event = "BufReadPost",
    config = function()
      require("neoscroll").setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    ft = "markdown",
    build = ":call mkdp#util#install()",
  },
  {
    "stevearc/aerial.nvim",
    event = "LspAttach",
    opts = {
      attach_mode = "global",
      backends = { "lsp", "treesitter", "markdown", "man" },
      layout = { min_width = 28 },
      show_guides = true,
      filter_kind = false,
      guides = {
        mid_item = "├ ",
        last_item = "└ ",
        nested_top = "│ ",
        whitespace = "  ",
      },
      keymaps = {
        ["[y"] = "actions.prev",
        ["]y"] = "actions.next",
        ["[Y"] = "actions.prev_up",
        ["]Y"] = "actions.next_up",
        ["{"] = false,
        ["}"] = false,
        ["[["] = false,
        ["]]"] = false,
      },
      disable_max_lines = 100000000,
    },
  },
  {
    "jghauser/mkdir.nvim",
    event = "BufNewFile",
  },
  {
    "lambdalisue/suda.vim",
    cmd = { "SudaRead", "SudaWrite" },
  },
  {
    "simrat39/symbols-outline.nvim",
    lazy = true,
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
    config = function()
      local opts = {
        highlight_hovered_item = true,
        show_guides = true,
        auto_preview = false,
        position = "right",
        relative_width = true,
        width = 25,
        auto_close = false,
        show_numbers = false,
        show_relative_numbers = false,
        show_symbol_details = true,
        preview_bg_highlight = "Pmenu",
        autofold_depth = nil,
        auto_unfold_hover = true,
        fold_markers = { "", "" },
        wrap = false,
        keymaps = { -- These keymaps can be a string or a table for multiple keys
          close = { "<Esc>", "q" },
          goto_location = "<Cr>",
          focus_location = "o",
          hover_symbol = "<C-space>",
          toggle_preview = "K",
          rename_symbol = "r",
          code_actions = "a",
          fold = "h",
          unfold = "l",
          fold_all = "P",
          unfold_all = "U",
          fold_reset = "Q",
        },
        lsp_blacklist = {},
        symbol_blacklist = {},
        symbols = {
          File = { icon = "", hl = "@text.uri" },
          Module = { icon = "", hl = "@namespace" },
          Namespace = { icon = "", hl = "@namespace" },
          Package = { icon = "", hl = "@namespace" },
          Class = { icon = "𝓒", hl = "@type" },
          Method = { icon = "ƒ", hl = "@method" },
          Property = { icon = "", hl = "@method" },
          Field = { icon = "", hl = "@field" },
          Constructor = { icon = "", hl = "@constructor" },
          Enum = { icon = "", hl = "@type" },
          Interface = { icon = "ﰮ", hl = "@type" },
          Function = { icon = "", hl = "@function" },
          Variable = { icon = "", hl = "@constant" },
          Constant = { icon = "", hl = "@constant" },
          String = { icon = "𝓐", hl = "@string" },
          Number = { icon = "#", hl = "@number" },
          Boolean = { icon = "", hl = "@boolean" },
          Array = { icon = "", hl = "@constant" },
          Object = { icon = "", hl = "@type" },
          Key = { icon = "🔐", hl = "@type" },
          Null = { icon = "NULL", hl = "@type" },
          EnumMember = { icon = "", hl = "@field" },
          Struct = { icon = "𝓢", hl = "@type" },
          Event = { icon = "🗲", hl = "@type" },
          Operator = { icon = "+", hl = "@operator" },
          TypeParameter = { icon = "𝙏", hl = "@parameter" },
          Component = { icon = "󰡀", hl = "@function" },
          Fragment = { icon = "", hl = "@constant" },
        },
      }
      require("symbols-outline").setup(opts)
    end,
  },
  -- {
  --   "nvim-zh/colorful-winsep.nvim",
  --   config = true,
  --   event = { "WinNew" },
  -- },
}

return plugins
