local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local btns = null_ls.builtins

-- Please set additional flags for the supported servers here
-- Don't specify any config here if you are using the default one.
local sources = {
  btns.formatting.clang_format.with {
    filetypes = { "c", "cpp" },
  },
  btns.formatting.shfmt,
  btns.formatting.stylua,
  btns.formatting.prettier,
}
null_ls.setup {
  border = "rounded",
  debug = false,
  log_level = "warn",
  update_in_insert = false,
  sources = sources,
}
