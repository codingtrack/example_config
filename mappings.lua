---@type MappingsTable
local M = {}

M.disabled = {
    n = {
        ["<C-c>"] = "",
        ["<leader>cm"] = "",
    }
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>q"] = { "<cmd>q<CR>", "quit" },
    ["<leader>u"] = { "<cmd>NvChadUpdate<CR>", "NvChadUpdate" },
  },
}

M.telescope = {
  n = {
    ["<leader>fp"] = { "<cmd>Telescope projects<CR>", "find projects" },
    ["<leader>fn"] = { "<cmd>Telescope file_browser<CR>", "file browser" },
    ["<leader>fs"] = { "<cmd>Telescope grep_string<CR>", "search current word" },
    ["<leader>fr"] = { "<cmd>Telescope frecency<CR>", "find frecency" },
    ["<leader>fw"] = { "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "live grep" },
    -- git
    ["<leader>gb"] = { "<cmd>Telescope git_branches<CR>", "git branches" },
    ["<leader>gm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
  },
}

M.Neogit = {
  n = {
    ["<leader>gg"] = { "<cmd>Neogit<CR>", "Neogit" },
  },
}

M.diffview = {
  n = {
    ["<leader>dd"] = { "<cmd>DiffviewClose<CR>", "DiffviewClose" },
    ["<leader>df"] = { "<cmd>DiffviewFileHistory %<CR>", "DiffviewFileHistory" },
  },
}

M.lazy = {
  n = {
    ["<leader>ps"] = { "<cmd>Lazy sync<CR>", "lazy sync" },
    ["<leader>pi"] = { "<cmd>Lazy<CR>", "lazy info" },
    ["<leader>pc"] = { "<cmd>Lazy check<CR>", "lazy check" },
  },
}

M.lspconfig = {
  n = {
    ["gd"] = { "<cmd>Telescope lsp_definitions<CR>", "peek definition" },
    ["gr"] = { "<cmd>Telescope lsp_references<CR>", "peek reference" },
    ["<leader>ls"] = { "<cmd>Telescope lsp_document_symbols<CR>", "document symbols" },
    ["<leader>lS"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "workspace symbols" },
    ["<leader>li"] = { "<cmd>LspInfo<CR>", "lspinfo" },
    ["<leader>ld"] = { "<cmd>Telescope diagnostics<CR>", "diagnostics" },
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
    ["ga"] = { "<cmd>EasyAlign<CR>", "easyalign" },
  },
  v = {
    ["ga"] = { "<cmd>EasyAlign<CR>", "easyalign" },
  },
}

M.markdown = {
  n = {
    ["<leader>m"] = { "<cmd>MarkdownPreviewToggle<CR>", "MarkdownPreviewToggle" },
  },
}

-- more keybinds!

return M
