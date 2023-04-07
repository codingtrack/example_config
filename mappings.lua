---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>wv"] = { "<cmd>vsplit<CR>", "vsplit" },
    ["<leader>q"] = { "<cmd>q<CR>", "quit" },
    ["<leader>u"] = { "<cmd>NvChadUpdate<CR>", "NvChadUpdate" },
  },
}

M.telescope = {
  n = {
    ["<leader>fp"] = { "<cmd>Telescope projects<CR>", "open projects" },
  },
}

M.Neogit = {
  n = {
    ["<leader>gg"] = { "<cmd>Neogit<CR>", "Neogit" },
  },
}

M.diffview = {
  n = {
    ["<leader>D"] = { "<cmd>DiffviewClose<CR>", "DiffviewClose" },
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
    ["gd"] = { "<cmd>Lspsaga peek_definition<CR>", "peek definition" },
    ["gD"] = { "<cmd>Lspsaga goto_definition<CR>", "goto definition" },
    ["gr"] = { "<cmd>Lspsaga lsp_finder<CR>", "peek reference" },
    ["<leader>ls"] = { "<cmd>Telescope lsp_document_symbols<CR>", "document symbols" },
    ["<leader>lS"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "workspace symbols" },
    ["<leader>li"] = { "<cmd>LspInfo<CR>", "lspinfo" },
    ["<leader>ld"] = { "<cmd>Telescope diagnostics<CR>", "diagnostics" },
    ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "code actions" },
  },
}

M.gitsigns = {
  n = {
    ["<leader>gb"] = { "<cmd>Telescope git_branches<CR>", "git branches" },
  },
}

M.spectre = {
  n = {
    ["<leader>S"] = { "<cmd>lua require('spectre').open()<CR>", "Open spectre" },
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
    ["<leader>gw"] = { "<cmd>HopWord<CR>", "HopWord" },
    ["<leader>gl"] = { "<cmd>HopLine<CR>", "HopLine" },
  },
}

-- more keybinds!

return M
