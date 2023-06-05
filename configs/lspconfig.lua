-- local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local utils = require "core.utils"

local on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad_ui.signature").setup(client)
  end
  if client.server_capabilities["documentSymbolProvider"] then
    require("nvim-navic").attach(client, bufnr)
  end
end

-- if you just want default config for the servers then put them in a table
local servers = { "bashls", "gopls", "marksman", "yamlls", "pyright" }

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
    "--background-index",
    "--completion-style=detailed",
    "--fallback-style=LLVM",
    "--function-arg-placeholders=false",
    "--header-insertion-decorators",
    "--header-insertion=never",
    "--pch-storage=memory",
    "--pretty",
    "--malloc-trim",
    "--query-driver=/usr/bin/g++",
  },
  root_dir = function(fname)
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
