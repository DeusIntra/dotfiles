local vue_typescript_plugin_path = vim.fn.stdpath('data')
    .. '/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin'

local opts = {
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_typescript_plugin_path,
        languages = { 'vue' },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  single_file_support = true,
}
return opts
