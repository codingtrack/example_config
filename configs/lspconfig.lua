local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "bashls", "gopls", "marksman", "yamlls", "pyright", "jsonls", "cmake" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    single_file_support = true,
  }
end

capabilities.offsetEncoding = { "utf-16" }

local root_files = {
  ".clangd",
  ".clang-tidy",
  ".clang-format",
  ".git",
  -- 'compile_commands.json',
  -- 'compile_flags.txt',
  -- 'configure.ac', -- AutoTools
}

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--clang-tidy",
    "--enable-config",
    "--background-index",
    "--completion-style=bundled",
    "--function-arg-placeholders=false",
    "--header-insertion-decorators",
    "--header-insertion=never",
    "--malloc-trim",
    "--ranking-model=heuristics",
    "--pch-storage=disk",
    "-j=12",
  },
  root_dir = function(fname)
    ---@diagnostic disable-next-line: deprecated
    return lspconfig.util.root_pattern(unpack(root_files))(fname) or lspconfig.util.find_git_ancestor(fname)
  end,
  single_file_support = true,
}

lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "jsonnet-language-server",
  },
}

lspconfig.cmake.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "neocmakelsp",
    "--stdio",
  },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "pylsp" },
}
