local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    event = { "CursorHold", "CursorHoldI" },
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
    "hiphish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.rainbow_delimiters"
    end,
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
        "debugloop/telescope-undo.nvim",
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
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   event = { "CursorHold", "CursorHoldI" },
  --   config = function()
  --     require "custom.configs.null-ls"
  --   end,
  -- },
  {
    "ahmedkhalf/project.nvim",
    event = "VimEnter",
    config = function()
      require("project_nvim").setup {
        detection_methods = { "pattern" },
        patterns = { ".git", ".svn", ".clang-format", "package.json", ".hgtags" },
        ignore_lsp = { "null-ls", "copilot" },
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
    "NeogitOrg/neogit",
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
    "gelguy/wilder.nvim",
    event = "CmdlineEnter",
    config = require "custom.configs.wilder",
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
      require("todo-comments").setup {}
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
    config = require "custom.configs.bigfile",
  },
  {
    "karb94/neoscroll.nvim",
    event = { "VeryLazy" },
    config = require "custom.configs.neoscroll",
  },
  {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    ft = "markdown",
    build = "cd app && npm install",
  },
  {
    "stevearc/aerial.nvim",
    event = "LspAttach",
    opts = require "custom.configs.aerial",
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
      require("nvim-surround").setup {}
    end,
  },
  {
    "utilyre/sentiment.nvim",
    version = "*",
    keys = { "%" },
    opts = {
      -- config
    },
    init = function()
      -- `matchparen.vim` needs to be disabled manually in case of lazy loading
      vim.g.loaded_matchparen = 1
    end,
  },
  {
    "Bekaboo/dropbar.nvim",
    event = "LspAttach",
    config = function()
      require("dropbar").setup {}
    end,
  },
  {
    "abecodes/tabout.nvim",
    event = { "InsertEnter" },
    config = require "custom.configs.tabout",
  },
  {
    "kelly-lin/ranger.nvim",
    event = "BufReadPost",
    config = function()
      require("ranger-nvim").setup { replace_netrw = true, enable_cmds = true }
    end,
  },
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    config = require "custom.configs.illuminate",
  },
  {
    "olimorris/persisted.nvim",
    cmd = {
      "SessionToggle",
      "SessionStart",
      "SessionStop",
      "SessionSave",
      "SessionLoad",
      "SessionLoadLast",
      "SessionLoadFromFile",
      "SessionDelete",
    },
    event = "VeryLazy",
    config = require "custom.configs.persisted",
  },
  {
    "mg979/vim-visual-multi",
    event = "BufReadPost",
    branch = "master",
  },
  -- {
  --   "nvimdev/guard.nvim",
  --   event = { "CursorHold", "CursorHoldI" },
  --   config = require "custom.configs.guard",
  -- },
  {
    "ojroques/nvim-bufdel",
    event = "BufReadPost",
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
      -- options
      fmt = {
        max_messages = 3, -- The maximum number of messages stacked at any give time
      },
    },
  },
  {
    "nmac427/guess-indent.nvim",
    event = { "InsertEnter" },
    config = function()
      require("guess-indent").setup {}
    end,
  },
  {
    "sbdchd/neoformat",
    event = { "BufReadPre" },
    cmd = { "Neoformat" },
  },
}

return plugins
