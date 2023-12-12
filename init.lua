local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

autocmd({ "VimLeave" }, {
  callback = function()
    vim.cmd "sleep 1m"
  end,
})

-- triggers CursorHold event faster
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.backup = false
vim.opt.backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim"
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.diffopt = "filler,iwhite,internal,linematch:60,algorithm:patience"
vim.opt.mousemodel = "extend"
vim.opt.swapfile = false
vim.opt.fileencoding = "utf-8"
vim.opt.writebackup = false
vim.opt.updatetime = 100
vim.opt.breakindent = true -- Wrap indent to match  line start
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.viewoptions:remove "curdir" -- disable saving current directory with views
vim.opt.shortmess:append { s = true, I = true } -- disable startup message
vim.opt.backspace = "indent,eol,start"
vim.wo.wrap = true
vim.wo.linebreak = true
vim.opt.fileformats = "unix,mac,dos"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.formatoptions = "1jcroql"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --hidden --vimgrep --smart-case --"
vim.opt.wildignore =
  ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**"
vim.opt.wildignorecase = true
vim.opt.preserveindent = true
vim.opt.list = true
vim.opt.listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←"
-- vim.lsp.set_log_level("off")
-- vim.opt.relativenumber = true

vim.g.neoformat_basic_format_align = 1
vim.g.neoformat_basic_format_trim = 1
vim.g.neoformat_basic_format_retab = 1

-- autocmd("BufEnter", {
--   pattern = "*",
--   callback = function()
--     vim.cmd "silent! :lcd%:p:h"
--   end,
-- })

vim.g.VM_maps = { ["Find Under"] = "<C-p>" }

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
  vim.keymap.set("v", "<C-S-c>", '"+y') -- Copy
  vim.keymap.set("n", "<C-S-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<C-S-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<C-S-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<C-S-v>", '<ESC>l"+Pli') -- Paste insert mode
end
