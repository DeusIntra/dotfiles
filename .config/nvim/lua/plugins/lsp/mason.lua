local ensure_installed = {}
local lsp_list = require("plugins/lsp/lsp-list")
for k in pairs(lsp_list) do
  table.insert(ensure_installed, k)
end

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = ensure_installed
})
