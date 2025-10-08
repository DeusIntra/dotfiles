local lsp_list = require("plugins/lsp/lsp-list")

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = lsp_list
})
require("mason-nvim-dap").setup({
  ensure_installed = { "php" }
})
