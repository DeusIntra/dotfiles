local lspconfig = require("lspconfig")
local lsps_by_filetype = require("plugins/lsp/lsp-list")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

--[[ General LSP configuration ]]--
for lsp, filetypes in pairs(lsps_by_filetype) do
  local opts = {
    settings = {},
    -- on_attach = on_attach,
    capabilities = capabilities,
  }
  if #filetypes > 0 then
    opts["filetypes"] = filetypes
  end
  lspconfig[lsp].setup(opts)
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

--[[ Custom configuration per LSP ]]--
-- If you are using mason.nvim, you can get the ts_plugin_path like this
-- local mason_registry = require("mason-registry")
-- local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path() .. "/node_modules/@vue/language-server"
local mason_registry = require("mason-registry")
local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path() .. "/node_modules/@vue/language-server"

lspconfig.ts_ls.setup {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
}

lspconfig.volar.setup {
  capabilities = capabilities,
}

