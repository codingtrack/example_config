---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<C-c>"] = "",
    ["<leader>cm"] = "",
    ["<leader>f"] = "",
    ["<leader>x"] = "",
    ["<leader>ma"] = "",
    ["<leader>h"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "Enter Command Mode", opts = { nowait = true } },
    ["q"] = { "<cmd>q<CR>", "Quit" },
    ["<leader>u"] = { "<cmd>NvChadUpdate<CR>", "NvChadUpdate" },
  },
}

M.telescope = {
  n = {
    ["<leader>fp"] = { "<cmd>Telescope projects<CR>", "Find projects" },
    ["<leader>fs"] = { "<cmd>Telescope grep_string<CR>", "Find word" },
    ["<leader>fr"] = {
      function()
        require("telescope").extensions.frecency.frecency {}
      end,
      "Find frecency",
    },
    ["<leader>fw"] = { "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "Live grep" },
    ["<leader>fz"] = { "<cmd>Telescope zoxide list<CR>", "Zoxide list" },
    ["<leader>ff"] = {
      function()
        require("custom.configs.telescope").find_project_files { previewer = false }
      end,
      "Find files",
    },
    ["<leader>fc"] = { "<cmd>Telescope registers<CR>", "Find registers" },
    ["<leader>fu"] = { "<cmd>Telescope undo<CR>", "Find undo" },
    -- git
    ["<leader>gb"] = { "<cmd>Telescope git_branches<CR>", "Git branches" },
    ["<leader>gm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>tm"] = { "<cmd> Telescope marks <CR>", "Telescope bookmarks" },
  },
}

M.Neogit = {
  n = {
    ["<leader>gg"] = { "<cmd>Neogit<CR>", "Neogit" },
  },
}

M.diffview = {
  n = {
    ["<leader>do"] = { "<cmd>DiffviewOpen<CR>", "DiffviewOpen" },
    ["<leader>dc"] = { "<cmd>DiffviewClose<CR>", "DiffviewClose" },
    ["<leader>df"] = { "<cmd>DiffviewFileHistory %<CR>", "DiffviewFileHistory" },
  },
}

M.lazy = {
  n = {
    ["<leader>ps"] = { "<cmd>Lazy sync<CR>", "Lazy sync" },
    ["<leader>pi"] = { "<cmd>Lazy<CR>", "Lazy info" },
    ["<leader>pc"] = { "<cmd>Lazy check<CR>", "Lazy check" },
  },
}

M.lspconfig = {
  n = {
    ["gd"] = { "<cmd>Telescope lsp_definitions<CR>", "Goto definition" },
    ["gr"] = { "<cmd>Telescope lsp_references<CR>", "Goto reference" },
    ["<leader>ls"] = {
      function()
        local aerial_avail, _ = pcall(require, "aerial")
        if aerial_avail then
          require("telescope").extensions.aerial.aerial()
        else
          require("telescope.builtin").lsp_document_symbols()
        end
      end,
      "Document symbols",
    },
    ["<leader>lS"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "Workspace symbols" },
    ["<leader>li"] = { "<cmd>LspInfo<CR>", "Lspinfo" },
    ["<leader>ld"] = { "<cmd>Telescope diagnostics<CR>", "Diagnostics" },
    ["<leader>lf"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
    ["<leader>ca"] = { "<cmd>CodeActionMenu<CR>", "LSP code action" },
  },
}

M.spectre = {
  n = {
    ["<leader>ss"] = { "<cmd>lua require('spectre').open()<CR>", "Open spectre" },
    ["<leader>sw"] = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Search current word" },
    ["<leader>sp"] = {
      "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
      "Search on current file",
    },
  },
  v = {
    ["<leader>sw"] = { "<cmd>lua require('spectre').open_visual()<CR>", "Search current word" },
    ["<leader>sp"] = {
      "<cmd>lua require('spectre').open_file_search()<CR>",
      "Search on current file",
    },
  },
}

M.hop = {
  n = {
    ["<leader>hw"] = { "<cmd>HopWord<CR>", "HopWord" },
    ["<leader>hl"] = { "<cmd>HopLine<CR>", "HopLine" },
    ["<leader>hc"] = { "<cmd>HopChar1CurrentLine<CR>", "HopChar1CurrentLine" },
    ["<leader>hp"] = { "<cmd>HopPattern<CR>", "HopPattern" },
  },
}

M.easyalign = {
  n = {
    ["ga"] = { "<cmd>EasyAlign<CR>", "EasyAlign" },
  },
  v = {
    ["ga"] = { "<cmd>EasyAlign<CR>", "EasyAlign" },
  },
}

M.markdown = {
  n = {
    ["<leader>md"] = { "<cmd>MarkdownPreviewToggle<CR>", "MarkdownPreviewToggle" },
  },
}

M.tabufline = {
  n = {
    ["<leader>xc"] = { "<cmd>BufDel<CR>", "Close current buffer" },
    ["<leader>xa"] = { "<cmd>BufDelOthers<CR>", "Close other buffer" },
  },
}

M.Aerial = {
  n = {
    ["<leader>lo"] = { "<cmd>AerialToggle<CR>", "SymbolsOutline" },
  },
}

M.mason = {
  n = {
    ["<leader>mm"] = { "<cmd>Mason<CR>", "Mason" },
    ["<leader>ma"] = { "<cmd>MasonInstallAll<CR>", "MasonInstallAll" },
    ["<leader>mu"] = { "<cmd>MasonUpdata<CR>", "MasonUpdata" },
  },
}

M.wilder = {
  n = {
    ["<leader>tw"] = { "<cmd>lua require('wilder').toggle()<CR>", "Toggle wilder" },
  },
}

M.ranger = {
  n = {
    ["<leader>fe"] = { "<cmd>Ranger<CR>", "Ragner" },
  },
}

M.persisted = {
  n = {
    ["<leader>Ss"] = { "<cmd>SessionSave<CR>", "SessionSave" },
    ["<leader>Sr"] = { "<cmd>SessionLoad<CR>", "SessionLoad" },
    ["<leader>Sl"] = { "<cmd>SessionLoadLast<CR>", "SessionLoadLast" },
    ["<leader>Sd"] = { "<cmd>SessionDelete<CR>", "SessionDelete" },
  },
}

M.gitsigns = {
  n = {
    ["<leader>td"] = { "<cmd>Gitsigns toggle_word_diff<CR>", "Gitsigns toggle_word_diff" },
  },
}

M.neoformat = {
  n = {
    ["<leader>fm"] = { "<cmd>Neoformat<CR>", "Formating" },
  },
  v = {
    ["<leader>fm"] = { "<cmd>Neoformat<CR>", "Formating" },
  },
}

return M
