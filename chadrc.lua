---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  lsp_semantic_tokens = true, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens
  -- nvdash = { load_on_startup = true },
  extended_integrations = { "notify", 'todo', 'codeactionmenu', 'hop' }, -- these aren't compiled by default, ex: "alpha", "notify"
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
