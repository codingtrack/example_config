local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "bashls", "gopls", "marksman", "yamlls", "pyright", "cmake", "jsonls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    single_file_support = true,
  }
end

local root_files = {
  ".clangd",
  ".clang-tidy",
  ".clang-format",
  ".git",
  -- 'compile_commands.json',
  -- 'compile_flags.txt',
  -- 'configure.ac', -- AutoTools
}

local function get_binary_path_list(binaries)
  local path_list = {}
  for _, binary in ipairs(binaries) do
    local path = vim.fn.exepath(binary)
    if path ~= "" then
      table.insert(path_list, path)
    end
  end
  return table.concat(path_list, ",")
end

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = vim.tbl_deep_extend("keep", { offsetEncoding = { "utf-16", "utf-8" } }, capabilities),
  cmd = {
    "clangd",
    "--clang-tidy",
    "--enable-config",
    "--background-index",
    "--query-driver=" .. get_binary_path_list { "clang++", "clang", "gcc", "g++" },
    "--all-scopes-completion",
    "--completion-style=detailed",
    "--header-insertion-decorators",
    "--header-insertion=never",
    "--malloc-trim",
    "--pch-storage=memory",
    "--limit-references=3000",
    "--limit-results=350",
    "-j=8",
  },
  root_dir = function(fname)
    ---@diagnostic disable-next-line: deprecated
    return lspconfig.util.root_pattern(unpack(root_files))(fname) or lspconfig.util.find_git_ancestor(fname)
  end,
  single_file_support = true,
}
