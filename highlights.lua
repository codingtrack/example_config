-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  DiffAdd = {
    bg = "#005f00",
    fg = "NONE",
  },
  DiffAdded = {
    bg = "#005f00",
    fg = "NONE",
  },
  DiffText = {
    bg = "#4C566A",
    fg = "NONE",
  },
  DiffDelete = {
    bg = "#5f0000",
    fg = "NONE",
  },
  DiffRemoved = {
    bg = "#5f0000",
    fg = "NONE",
  },
  DiffChange = {
    bg = "#4C566A",
    fg = "NONE",
  },
  DiffModified = {
    bg = "#4C566A",
    fg = "NONE",
  },
  DiffChangeDelete = {
    bg = "#5f0000",
    fg = "NONE",
  },
  DiffNewFile = {
    bg = "#005f00",
    fg = "NONE",
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  Winbar = { bg = "NONE" },
  WinBarNC = { bg = "NONE" },
}

return M
