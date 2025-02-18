local lspconfig = require("lspconfig")
local lspList = require("plugins/lsp/lsp-list")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, lsp in ipairs(lspList) do
  lspconfig[lsp].setup({
    settings = {},
    -- on_attach = on_attach,
    capabilities = capabilities,
  })
end

lspconfig.lua_ls.setup({
  -- on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = {"vim"} },
      telemetry = false,
    }
  }
})

-- If you are using mason.nvim, you can get the ts_plugin_path like this
-- local mason_registry = require('mason-registry')
-- local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'

local mason_registry = require("mason-registry")
local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'


lspconfig.ts_ls.setup {
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
}

lspconfig.volar.setup {
  capabilities = capabilities,
}


lspconfig.emmet_language_server.setup {
  capabilities = capabilities,
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'html', 'css', 'sass', 'scss', 'less' },
}

