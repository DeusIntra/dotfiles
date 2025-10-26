local get_files_from_dir = require("utils.get_files_from_dir")
local lsp_list = get_files_from_dir("config/lsp")
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup({
  ensure_installed = lsp_list,
  automatic_enable = true,
})

for _, lsp in ipairs(lsp_list) do
  local opts = require("config.lsp." .. lsp)
  -- if opts['capabilities'] == nil then
  --   opts['capabilities'] = capabilities
  -- end
  vim.lsp.config(lsp, opts)
end

vim.lsp.enable(lsp_list)
