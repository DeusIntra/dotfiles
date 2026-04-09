local ensure_installed = {
  "c",
  "c_sharp",
  "cpp",
  "css",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "json5",
  "lua",
  "php",
  "php_only",
  "scss",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "vue",
}


local treesitter = require('nvim-treesitter')

if treesitter == nil then return end

treesitter.install(ensure_installed)

vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'

vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
