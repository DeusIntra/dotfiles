local config = require("nvim-treesitter.configs")
config.setup({
  -- hilight = { enable = true },
  -- indent = { enable = true },
  ensure_installed = {
    "vim",
    "vimdoc",
    "lua",
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "tsx",
    "jsdoc",
    "json",
    "json5",
    "vue",
    "c",
    "cpp",
    "c_sharp",
    "php",
  },
})
