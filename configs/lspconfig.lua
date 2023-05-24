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
local servers = { "bashls", "gopls", "marksman", "yamlls", "cmake" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    single_file_support = true,
  }
end

capabilities.offsetEncoding = { "utf-16" }

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--clang-tidy",
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
  single_file_support = true,
}
