local null_ls = require "null-ls"
local btns = null_ls.builtins

-- Please set additional flags for the supported servers here
-- Don't specify any config here if you are using the default one.
local sources = {
  btns.formatting.clang_format.with {
    filetypes = { "c", "cpp" },
  },
  btns.formatting.prettier.with {
    filetypes = {
      "vue",
      "typescript",
      "javascript",
      "typescriptreact",
      "javascriptreact",
      "yaml",
      "html",
      "css",
      "scss",
      "sh",
      "markdown",
      "json",
    },
  },
  btns.formatting.stylua,
  btns.formatting.shfmt,
  btns.formatting.gofumpt,
}
null_ls.setup {
  border = "rounded",
  debug = false,
  log_level = "warn",
  update_in_insert = false,
  sources = sources,
}
