local opts = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { 'typescriptreact', 'javascriptreact' },
  init_options = {
    hostInfo = "neovim"
  },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" }
}

return opts
