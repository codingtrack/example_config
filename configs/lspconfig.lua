dofile(vim.g.base46_cache .. "lsp")
require "nvchad.lsp"
local lspconfig = require "lspconfig"
local map = vim.keymap.set
local conf = require("nvconfig").ui.lsp

local on_attach = function(client, bufnr)

    if conf.signature and client.server_capabilities.signatureHelpProvider then
        require("nvchad.signature").setup(client, bufnr)
    end

    local function opts(desc)
        return { buffer = bufnr, desc = desc }
    end

    map("n", "K", vim.lsp.buf.hover, opts "Lsp hover information")
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Lsp Add workspace folder")
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Lsp Remove workspace folder")

    map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts "Lsp List workspace folders")

    map("n", "<leader>ra", function()
        require "nvchad.renamer" ()
    end, opts "Lsp NvRenamer")
end

local on_init = function(client, _)
  if not conf.semantic_tokens and client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end


local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}
-- if you just want default config for the servers then put them in a table
local servers = { "bashls", "gopls", "marksman", "yamlls", "pyright", "cmake", "jsonls" }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        on_init = on_init,
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
    on_init = on_init,
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
        -- "--malloc-trim",
        "--pch-storage=memory",
        "--limit-references=3000",
        "--limit-results=350",
        "-j=2",
    },
    root_dir = function(fname)
        ---@diagnostic disable-next-line: deprecated
        return lspconfig.util.root_pattern(unpack(root_files))(fname) or lspconfig.util.find_git_ancestor(fname)
    end,
    single_file_support = true,
}

lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    on_init = on_init,

    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
            [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  }

