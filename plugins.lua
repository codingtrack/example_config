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
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "nvim-telescope/telescope.nvim",
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
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup {
        detection_methods = { "pattern" },
        patterns = { ".git", ".svn", ".clang-format", "package.json" },
      }
    end,
  },
  {
    "p00f/nvim-ts-rainbow",
    event = "VeryLazy",
  },
  {
    "TimUntersberger/neogit",
    -- event = "BufRead",
    event = "VeryLazy",
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
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
      create_autocmd = false,
      attach_navic = false,
      show_basename = false,
      show_dirname = false,
    },
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup {
        symbol_in_winbar = {
          enable = false,
        },
      }
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  -- {
  --   "gelguy/wilder.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     local wilder = require "wilder"
  --     wilder.setup { modes = { ":", "/", "?" } }
  --     wilder.set_option(
  --       "renderer",
  --       wilder.renderer_mux {
  --         [":"] = wilder.popupmenu_renderer {
  --           highlighter = wilder.basic_highlighter(),
  --         },
  --         ["/"] = wilder.wildmenu_renderer {
  --           highlighter = wilder.basic_highlighter(),
  --         },
  --       }
  --     )
  --   end,
  -- },
  {
    "ethanholz/nvim-lastplace",
    event = "VeryLazy",
    config = function()
      require("nvim-lastplace").setup {
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
        lastplace_open_folds = true,
      }
    end,
  },
  {
    "folke/noice.nvim",
    enabled = true,
    event = "VeryLazy",
    dependencies = { "rcarriga/nvim-notify", "muniftanjim/nui.nvim" },
    config = function()
      require("noice").setup {
        lsp = {
          progress = {
            enabled = false,
          },
        },
        presets = {
          bottom_search = false,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = true,
        },
        messages = {
          enabled = true,
          view = "notify",
          view_error = "notify",
          view_warn = "notify",
          view_history = "messages",
          view_search = "virtualtext",
        },
        health = {
          checker = false,
        },
      }
    end,
  },
  {
    "andymass/vim-matchup",
    -- Highlight, jump between pairs like if..else
    event = "VeryLazy",
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
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
}

return plugins
