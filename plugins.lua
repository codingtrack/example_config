local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
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
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },

  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      {
        "nvim-telescope/telescope-frecency.nvim",
        dependencies = { "kkharji/sqlite.lua" },
      },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      {
        "jvgrootveld/telescope-zoxide",
      },
    },
    opts = overrides.telescope,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = overrides.gitsigns,
  },
  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  },

  -- Install a plugin
  -- format & linting
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "CursorHold", "CursorHoldI" },
    config = function()
      require "custom.configs.null-ls"
    end,
  },
  {
    "HiPhish/nvim-ts-rainbow2",
    event = "BufReadPost",
  },
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
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "TimUntersberger/neogit",
    cmd = { "Neogit" },
    dependencies = {
      "sindrets/diffview.nvim",
      cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
      config = function()
        require("diffview").setup {
          enhanced_diff_hl = true,
        }
      end,
    },
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
      wilder.set_option("pipeline", {
        wilder.branch(wilder.cmdline_pipeline(), wilder.search_pipeline()),
      })
      -- wilder.set_option(
      --   "renderer",
      --   wilder.popupmenu_renderer(wilder.popupmenu_palette_theme {
      --     -- 'single', 'double', 'rounded' or 'solid'
      --     -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
      --     border = "rounded",
      --     max_height = "75%", -- max height of the palette
      --     min_height = 0, -- set to the same as 'max_height' for a fixed height window
      --     prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
      --     reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
      --   })
      -- )
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
          ftdetect,
          cmp,
          wilder,
        },
      }
    end,
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
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    keys = { "ys", "cs", "ds" },
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
}

return plugins
