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
    bg = "one_bg3",
  },
  DiffText = {
    bg = "one_bg3",
    fg = "green",
  },
  DiffDelete = {
    bg = "grey",
    fg = "red",
  },
  DiffChangeDelete = {
    bg = "grey",
    fg = "red",
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
