local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local mason_null_ls = require "mason-null-ls"
local btns = null_ls.builtins

-- Please set additional flags for the supported servers here
-- Don't specify any config here if you are using the default one.
local sources = {
  btns.formatting.clang_format.with {
    filetypes = { "c", "cpp" },
  },
  btns.formatting.shfmt,
  btns.formatting.stylua,
}
null_ls.setup {
  border = "rounded",
  debug = false,
  log_level = "warn",
  update_in_insert = false,
  sources = sources,
}

local null_ls_deps = {
    "clang_format",
    "stylua",
    "shfmt",
}

mason_null_ls.setup {
  ensure_installed = null_ls_deps,
  automatic_installation = false,
  automatic_setup = true,
}
require("mason-null-ls").setup_handlers()
