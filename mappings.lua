---@type MappingsTable
local M = {}
local map = vim.keymap.set

map("n", "<C-c>", "")
map("n", "<leader>cm", "")
map("n", "<leader>f", "")
map("n", "<leader>x", "")
map("n", "<leader>ma", "")
map("n", "<leader>h", function() end, { desc = "" })

-- general
map("n", "<C-h>", "<C-w>h", { desc = "Switch Window left" })
map("n", "q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>u", "<cmd>NvChadUpdate<CR>", { desc = "NvChadUpdate" })

-- telescope
map("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "Find projects" })
map("n", "<leader>fs", "<cmd>Telescope grep_string<CR>", { desc = "Find word" })
map("n", "<leader>fr", function()
    require("telescope").extensions.frecency.frecency {}
end, { desc = "Find frecency" })
map(
    "n",
    "<leader>fw",
    "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
    { desc = "Live grep" }
)
map("n", "<leader>fz", "<cmd>Telescope zoxide list<CR>", { desc = "Zoxide list" })
map("n", "<leader>ff", function()
    require("custom.configs.telescope").find_project_files { previewer = false }
end, { desc = "Find files" })
map("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Current buffer search" })
map("n", "<leader>fu", "<cmd>Telescope undo<CR>", { desc = "Undo list" })
-- git
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Git branches" })
map("n", "<leader>gm", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })
map("n", "<leader>tm", "<cmd>Telescope marks<CR>", { desc = "Find bookmarks" })
map("n", "<leader>sh", "<cmd>Telescope search_history<CR>", { desc = "Search History" })

-- Neogit
map("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Neogit" })

-- diffview
map("n", "<leader>do", "<cmd>DiffviewOpen<CR>", { desc = "DiffviewOpen" })
map("n", "<leader>dc", "<cmd>DiffviewClose<CR>", { desc = "DiffviewClose" })
map("n", "<leader>df", "<cmd>DiffviewFileHistory<CR>", { desc = "DiffviewFileHistory" })

-- lazy
map("n", "<leader>ps", "<cmd>Lazy sync<CR>", { desc = "Lazy sync" })
map("n", "<leader>pi", "<cmd>Lazy<CR>", { desc = "Lazy info" })
map("n", "<leader>pc", "<cmd>Lazy check<CR>", { desc = "Lazy check" })

-- lspconfig
map("n", "gd", "<cmd>Glance definitions<CR>", { desc = "Goto definitions" })
map("n", "gr", "<cmd>Glance references<CR>", { desc = "Goto references" })
map("n", "<leader>ls", function()
    local aerial_avail, _ = pcall(require, "aerial")
    if aerial_avail then
        require("telescope").extensions.aerial.aerial()
    else
        require("telescope.builtin").lsp_document_symbols()
    end
end, { desc = "Document symbols" })
map("n", "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "Workspace symbols" })
map("n", "<leader>li", "<cmd>LspInfo<CR>", { desc = "LspInfo" })
map("n", "<leader>ld", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })
map("n", "<leader>lf", function()
    vim.diagnostic.open_float { border = "rounded" }
end, { desc = "Floating diagnostic" })
map("n", "<leader>ca", function()
    require("actions-preview").code_actions()
end, { desc = "LSP code action" })

-- spectre
map("n", "<leader>ss", "<cmd>lua require('spectre').open()<CR>", { desc = "Open spectre" })
map(
    "n",
    "<leader>sw",
    "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
    { desc = "Search current word" }
)
map(
    "n",
    "<leader>sp",
    "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
    { desc = "Search on current file" }
)
map("v", "<leader>sw", "<cmd>lua require('spectre').open_visual()<CR>", { desc = "Search current word" })
map("v", "<leader>sp", "<cmd>lua require('spectre').open_file_search()<CR>", { desc = "Search on current file" })

-- hop
map("n", "<leader>hw", "<cmd>HopWord<CR>", { desc = "HopWord" })
map("n", "<leader>hl", "<cmd>HopLine<CR>", { desc = "HopLine" })
map("n", "<leader>hc", "<cmd>HopChar1CurrentLine<CR>", { desc = "HopChar1CurrentLine" })
map("n", "<leader>hp", "<cmd>HopPattern<CR>", { desc = "HopPattern" })

-- easyalign
map("n", "<leader>ga", "<cmd>EasyAlign<CR>", { desc = "EasyAlign" })
map("v", "<leader>ga", "<cmd>EasyAlign<CR>", { desc = "EasyAlign" })

-- markdown
map("n", "<leader>md", "<cmd>MarkdownPreviewToggle<CR>", { desc = "MarkdownPreviewToggle" })

-- tabufline
map("n", "<leader>xc", "<cmd>BufDel<CR>", { desc = "Close current buffer" })
map("n", "<leader>xa", "<cmd>BufDelOthers<CR>", { desc = "Close other buffers" })

-- Aerial
map("n", "<leader>lo", "<cmd>AerialToggle<CR>", { desc = "SymbolsOutline" })

-- mason
map("n", "<leader>mm", "<cmd>Mason<CR>", { desc = "Mason" })
map("n", "<leader>ma", "<cmd>MasonInstallAll<CR>", { desc = "MasonInstallAll" })
map("n", "<leader>mu", "<cmd>MasonUpdata<CR>", { desc = "MasonUpdata" })

-- ranger
map("n", "<leader>fe", "<cmd>Ranger<CR>", { desc = "Ranger" })

-- persisted
map("n", "<leader>Ss", "<cmd>SessionSave<CR>", { desc = "SessionSave" })
map("n", "<leader>Sr", "<cmd>SessionLoad<CR>", { desc = "SessionLoad" })
map("n", "<leader>Sl", "<cmd>SessionLoadLast<CR>", { desc = "SessionLoadLast" })
map("n", "<leader>Sd", "<cmd>SessionDelete<CR>", { desc = "SessionDelete" })

-- todo
map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "TodoTelescope" })

-- yanky
map("n", "<leader>fy", function()
    require("telescope").extensions.yank_history.yank_history {}
end, { desc = "Open Yank History" })

return M
