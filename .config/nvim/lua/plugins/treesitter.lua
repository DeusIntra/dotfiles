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
    "jsdoc",
    "json",
    "typescript",
    "vue",
    "c_sharp",
    "php",
  },
})
