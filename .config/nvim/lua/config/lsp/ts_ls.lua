local vue_language_server_path = vim.fn.expand '$MASON/packages' .. '/vue-language-server' .. '/node_modules/@vue/language-server'

local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}

local opts = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  init_options = {
    hostInfo = "neovim",
    plugins = {
      vue_plugin,
    }
  },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" }
}

return opts
