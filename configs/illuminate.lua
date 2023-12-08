return function()
  require("illuminate").configure {
    providers = {
      "lsp",
      "treesitter",
      "regex",
    },
    delay = 100,
    filetypes_denylist = {
      "DoomInfo",
      "DressingSelect",
      "NvimTree",
      "TelescopePrompt",
      "aerial",
      "Trouble",
      "alpha",
      "dashboard",
      "dirvish",
      "fugitive",
      "help",
      "neogitstatus",
      "norg",
      "toggleterm",
    },
    under_cursor = true,
    large_file_cutoff = 20000,
  }
end
