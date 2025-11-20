local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = {
  capabilities = capabilities,
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", "templ", "php" },
  init_options = {
    configurationSection = { "html", "css", "javascript", "php" },
    embeddedLanguages = {
      css = true,
      javascript = true
    },
    provideFormatter = true
  },
  root_markers = { "package.json", ".git" },
}

return opts
