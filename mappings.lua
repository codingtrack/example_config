---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>ps"] = { "<cmd>Lazy sync<CR>", "lazy sync" },
    ["<leader>gg"] = { "<cmd>Neogit<CR>", "Neogit" },
    ["<leader>wv"] = { "<cmd>vsplit<CR>", "vsplit" },
    ["<leader>q"] = { "<cmd>q<CR>", "quit" },
  },
}

M.telescope = {
  n = {
    ["<leader>fp"] = { "<cmd>Telescope projects<CR>", "open projects" },
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

-- more keybinds!

return M
