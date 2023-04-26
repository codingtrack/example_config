local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    event = { "BufAdd", "BufReadPost", "BufNewFile" },
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
    event = { "BufAdd", "BufReadPost", "BufNewFile" },
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
        event = "BufReadPost",
        config = function()
          require("project_nvim").setup {
            detection_methods = { "pattern" },
            patterns = { ".git", ".svn", ".clang-format", "package.json" },
          }
        end,
      },
      {
        "nvim-telescope/telescope-file-browser.nvim",
      },
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
    dependencies = { "sindrets/diffview.nvim" },
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
    event = "BufReadPost",
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
    "andymass/vim-matchup",
    -- Highlight, jump between pairs like if..else
    event = "BufReadPost",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
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
    event = "BufReadPost",
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
    event = "BufReadPost",
  },
  {
    "LunarVim/bigfile.nvim",
    config = function()
      require("bigfile").config {
        filesize = 1,
      }
    end,
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
  -- {
  --   "anuvyklack/windows.nvim",
  --   cmd = { "WindowsMaximize", "WindowsMaximizeVertically", "WindowsMaximizeHorizontally", "WindowsEqualize" },
  --   dependencies = {
  --     "anuvyklack/middleclass",
  --   },
  --   config = function()
  --     require("windows").setup {
  --       autowidth = {
  --         enable = false,
  --       },
  --       ignore = {
  --         buftype = { "quickfix" },
  --         filetype = {
  --           "NvimTree",
  --           "neo-tree",
  --           "undotree",
  --           "gundo",
  --           "qf",
  --           "toggleterm",
  --           "TelescopePrompt",
  --           "alpha",
  --           "netrw",
  --         },
  --       },
  --     }
  --   end,
  -- },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
}

return plugins
