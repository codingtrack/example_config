return function()
  local ft = require "guard.filetype"

  -- use clang-format and clang-tidy for c files
  ft("c"):fmt("clang-format")
  ft("cpp"):fmt("clang-format")

  -- use stylua to format lua files and no linter
  ft("lua"):fmt "stylua"

  -- use lsp to format first then use golines to format
  ft("go"):fmt("lsp"):append "golines"

  -- multiple files register
  ft("typescript,javascript,typescriptreact"):fmt "prettier"

  -- call setup LAST
  require("guard").setup {
    -- the only options for the setup function
    fmt_on_save = false,
    -- Use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = true,
  }
end

