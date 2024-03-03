vim.keymap.del("n", "<C-c>")
vim.keymap.del("n", "<leader>cm")
vim.keymap.del("n", "<leader>x")
vim.keymap.del("n", "<leader>h")
-- general
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Switch Window left" })
vim.keymap.set("n", "q", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>u", "<cmd>NvChadUpdate<CR>", { desc = "NvChadUpdate" })

-- telescope
vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "Find projects" })
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string<CR>", { desc = "Find word" })
vim.keymap.set("n", "<leader>fr", function()
    require("telescope").extensions.frecency.frecency {}
end, { desc = "Find frecency" })
vim.keymap.set(
    "n",
    "<leader>fw",
    "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
    { desc = "Live grep" }
)
vim.keymap.set("n", "<leader>fz", "<cmd>Telescope zoxide list<CR>", { desc = "Zoxide list" })
vim.keymap.set("n", "<leader>ff", function()
    require("custom.configs.telescope").find_project_files { previewer = false }
end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Current buffer search" })
vim.keymap.set("n", "<leader>fu", "<cmd>Telescope undo<CR>", { desc = "Undo list" })
-- git
vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Git branches" })
vim.keymap.set("n", "<leader>gm", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })
vim.keymap.set("n", "<leader>tm", "<cmd>Telescope marks<CR>", { desc = "Find bookmarks" })
vim.keymap.set("n", "<leader>sh", "<cmd>Telescope search_history<CR>", { desc = "Search History" })
--
-- Neogit
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Neogit" })
--
-- diffview
vim.keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<CR>", { desc = "DiffviewOpen" })
vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<CR>", { desc = "DiffviewClose" })
vim.keymap.set("n", "<leader>df", "<cmd>DiffviewFileHistory<CR>", { desc = "DiffviewFileHistory" })
--
-- lazy
vim.keymap.set("n", "<leader>ps", "<cmd>Lazy sync<CR>", { desc = "Lazy sync" })
vim.keymap.set("n", "<leader>pi", "<cmd>Lazy<CR>", { desc = "Lazy info" })
vim.keymap.set("n", "<leader>pc", "<cmd>Lazy check<CR>", { desc = "Lazy check" })
--
-- lspconfig
vim.keymap.set("n", "gd", "<cmd>Glance definitions<CR>", { desc = "Goto definitions" })
vim.keymap.set("n", "gr", "<cmd>Glance references<CR>", { desc = "Goto references" })
vim.keymap.set("n", "<leader>ls", function()
    local aerial_avail, _ = pcall(require, "aerial")
    if aerial_avail then
        require("telescope").extensions.aerial.aerial()
    else
        require("telescope.builtin").lsp_document_symbols()
    end
end, { desc = "Document symbols" })
vim.keymap.set("n", "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "Workspace symbols" })
vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<CR>", { desc = "LspInfo" })
vim.keymap.set("n", "<leader>ld", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>lf", function()
    vim.diagnostic.open_float { border = "rounded" }
end, { desc = "Floating diagnostic" })
vim.keymap.set("n", "<leader>ca", function()
    require("actions-preview").code_actions()
end, { desc = "LSP code action" })

-- spectre
vim.keymap.set("n", "<leader>ss", "<cmd>lua require('spectre').open()<CR>", { desc = "Open spectre" })
vim.keymap.set(
    "n",
    "<leader>sw",
    "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
    { desc = "Search current word" }
)
vim.keymap.set(
    "n",
    "<leader>sp",
    "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
    { desc = "Search on current file" }
)
vim.keymap.set("v", "<leader>sw", "<cmd>lua require('spectre').open_visual()<CR>", { desc = "Search current word" })
vim.keymap.set(
    "v",
    "<leader>sp",
    "<cmd>lua require('spectre').open_file_search()<CR>",
    { desc = "Search on current file" }
)
--
-- hop
vim.keymap.set("n", "<leader>hw", "<cmd>HopWord<CR>", { desc = "HopWord" })
vim.keymap.set("n", "<leader>hl", "<cmd>HopLine<CR>", { desc = "HopLine" })
vim.keymap.set("n", "<leader>hc", "<cmd>HopChar1CurrentLine<CR>", { desc = "HopChar1CurrentLine" })
vim.keymap.set("n", "<leader>hp", "<cmd>HopPattern<CR>", { desc = "HopPattern" })

-- easyalign
vim.keymap.set("n", "<leader>ga", "<cmd>EasyAlign<CR>", { desc = "EasyAlign" })
vim.keymap.set("v", "<leader>ga", "<cmd>EasyAlign<CR>", { desc = "EasyAlign" })

-- markdown
vim.keymap.set("n", "<leader>md", "<cmd>MarkdownPreviewToggle<CR>", { desc = "MarkdownPreviewToggle" })

-- tabufline
vim.keymap.set("n", "<leader>xc", "<cmd>BufDel<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>xa", "<cmd>BufDelOthers<CR>", { desc = "Close other buffers" })

-- Aerial
vim.keymap.set("n", "<leader>lo", "<cmd>AerialToggle<CR>", { desc = "SymbolsOutline" })

-- mason
vim.keymap.set("n", "<leader>mm", "<cmd>Mason<CR>", { desc = "Mason" })
vim.keymap.set("n", "<leader>ma", "<cmd>MasonInstallAll<CR>", { desc = "MasonInstallAll" })
vim.keymap.set("n", "<leader>mu", "<cmd>MasonUpdata<CR>", { desc = "MasonUpdata" })

-- ranger
vim.keymap.set("n", "<leader>fe", "<cmd>Ranger<CR>", { desc = "Ranger" })

-- persisted
vim.keymap.set("n", "<leader>Ss", "<cmd>SessionSave<CR>", { desc = "SessionSave" })
vim.keymap.set("n", "<leader>Sr", "<cmd>SessionLoad<CR>", { desc = "SessionLoad" })
vim.keymap.set("n", "<leader>Sl", "<cmd>SessionLoadLast<CR>", { desc = "SessionLoadLast" })
vim.keymap.set("n", "<leader>Sd", "<cmd>SessionDelete<CR>", { desc = "SessionDelete" })

-- todo
vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "TodoTelescope" })

-- yanky
vim.keymap.set("n", "<leader>fy", function()
    require("telescope").extensions.yank_history.yank_history {}
end, { desc = "Open Yank History" })
