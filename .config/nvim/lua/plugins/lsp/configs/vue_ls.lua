local opts = {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  init_options = {
    vue = {
      -- disable hybrid mode
      hybridMode = false,
    },
  },
}

return opts
