local navic = require("nvim-navic")

if navic == nil then return end

navic.setup({
  lsp = {
    auto_attach = true,
    preference = { "vue_ls", "ts_ls" },
  },
})
