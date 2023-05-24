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
    ["<leader>q"] = { "<cmd>q<CR>", "Quit" },
    ["<leader>u"] = { "<cmd>NvChadUpdate<CR>", "NvChadUpdate" },
  },
}

M.telescope = {
  n = {
    ["<leader>fp"] = { "<cmd>Telescope projects<CR>", "Find projects" },
    ["<leader>fn"] = { "<cmd>Telescope file_browser<CR>", "File browser" },
    ["<leader>fs"] = { "<cmd>Telescope grep_string<CR>", "Find word" },
    ["<leader>fr"] = { "<cmd>Telescope frecency<CR>", "Find frecency" },
    ["<leader>fw"] = { "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "Live grep" },
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
  },
}

M.hop = {
  n = {
    ["<leader>hw"] = { "<cmd>HopWord<CR>", "HopWord" },
    ["<leader>hl"] = { "<cmd>HopLine<CR>", "HopLine" },
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
    ["<leader>m"] = { "<cmd>MarkdownPreviewToggle<CR>", "MarkdownPreviewToggle" },
  },
}

M.tabufline = {
  n = {
    ["<leader>xc"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close current buffer",
    },
    ["<leader>xa"] = {
      function()
        require("nvchad_ui.tabufline").closeOtherBufs()
      end,
      "Close other buffer",
    },
  },
}

M.Aerial = {
  n = {
    ["<leader>lo"] = { "<cmd>AerialToggle<CR>", "SymbolsOutline" },
  },
}

M.Harpoon = {
  n = {
    ["<leader>of"] = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Add File" },
    ["<leader>ot"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Toggle Menu" },
    ["<leader>on"] = { "<cmd>lua require('harpoon.ui').nav_next()<CR>", "Next" },
    ["<leader>op"] = { "<cmd>lua require('harpoon.ui').nav_prev()<CR>", "Prev" },
    ["<leader>oh"] = { "<cmd>Telescope harpoon marks<CR>", "Telescope Harpoon" },
    ["<leader>od"] = { "<cmd>lua require('harpoon.mark').rm_file()<CR>", "Remove File" },
  },
}

M.persistence = {
  n = {
    ["<leader>a"] = { "<cmd>lua require('persistence').load()<CR>", "Restore last session" },
  },
}

M.refactoring = {
  v = {
    ["<leader>rr"] = { "<cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", "Refactoring" },
  },
  n = {
    ["<leader>rr"] = { "<cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", "Refactoring" },
  },
}

M.mason = {
  n = {
    ["<leader>mm"] = { "<cmd>Mason<CR>", "Mason" },
  },
}

return M
