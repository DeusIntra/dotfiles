local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("plugins/lazy")
require("plugins/treesitter")
require("plugins/lsp")
require("plugins/lualine")
require("plugins/tokyonight-theme")
require("plugins/snippets/luasnip")
require("plugins/autotag")
require("plugins/comment")
