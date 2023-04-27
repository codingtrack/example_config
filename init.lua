-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
-- triggers CursorHold event faster
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.mousemodel = "extend"
vim.opt.swapfile = false
vim.opt.fileencoding = "utf-8"
vim.opt.backup = false
vim.opt.smartindent = false
vim.opt.updatetime = 100

-- autocmd({
--   "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
--   "BufWinEnter",
--   "CursorHold",
--   "InsertLeave",
--
--   -- include these if you have set `show_modified` to `true`
--   "BufWritePost",
--   "TextChanged",
--   "TextChangedI",
-- }, {
--   group = vim.api.nvim_create_augroup("barbecue.updater", {}),
--   callback = function()
--     require("barbecue.ui").update()
--   end,
-- })

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  vim.g.neovide_refresh_rate = 60
  vim.o.guifont = "JetBrainsMonoNL NF:h11" -- text below applies for VimScript
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_fullscreen = false
  vim.g.neovide_input_use_logo = true -- true on macOS
  vim.opt.mousemoveevent = true
end
