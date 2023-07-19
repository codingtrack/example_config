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
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost" },
    dependencies = {
      {
        "hiphish/rainbow-delimiters.nvim",
        config = function()
          require "custom.configs.rainbow_delimiters"
        end,
      },
    },
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
    event = { "CursorHold", "CursorHoldI" },
    config = function()
      require("neoscroll").setup()
    end,
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
  {
    "utilyre/sentiment.nvim",
    version = "*",
    event = "VeryLazy", -- keep for lazy loading
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
    event = "VeryLazy",
    config = function()
      require("dropbar").setup {}
    end,
  },
  {
    "abecodes/tabout.nvim",
    event = { "VeryLazy" },
    config = function()
      require("tabout").setup {
        tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = "<C-d>", -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = true, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {}, -- tabout will ignore these filetypes
      }
    end,
    wants = { "nvim-treesitter" }, -- or require if not used so far
    after = { "nvim-cmp" }, -- if a completion plugin is using tabs load it before
  },
  {
    "kelly-lin/ranger.nvim",
    event = "VeryLazy",
    config = function()
      require("ranger-nvim").setup { replace_netrw = true, enable_cmds = true }
      vim.api.nvim_set_keymap("n", "<leader>ef", "", {
        noremap = true,
        callback = function()
          require("ranger-nvim").open(true)
        end,
      })
    end,
  },
}

return plugins
