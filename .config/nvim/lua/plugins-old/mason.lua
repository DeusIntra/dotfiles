local lsp_list = require("plugins/lsp/lsp-list")
local dap_list = require("plugins/dap/dap-list")

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = lsp_list
})
require("mason-nvim-dap").setup({
  ensure_installed = dap_list
})
require("mason-conform").setup()

