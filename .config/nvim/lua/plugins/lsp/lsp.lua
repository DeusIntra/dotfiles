local lspconfig = vim.lsp.config
local lsp_list = require("plugins/lsp/lsp-list")
local capabilities = require("cmp_nvim_lsp").default_capabilities()


--[[ General LSP configuration ]]--
for _, lsp in ipairs(lsp_list) do
  local opts = require("plugins/lsp/configs/" .. lsp)
  if opts['capabilities'] == nil then
    opts['capabilities'] = capabilities
  end
  lspconfig(lsp, opts)
end

