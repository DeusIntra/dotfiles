-- See https://docs.devsense.com/vscode/configuration/
-- settings = {
--   php = {
--   },
-- }

vim.lsp.config("phptools", {
  cmd = { 'devsense-php-ls', '--stdio' },
  filetypes = { 'php' },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local cwd = assert(vim.uv.cwd())
    local root = vim.fs.root(fname, { 'composer.json', '.git' })

    -- prefer cwd if root is a descendant
    on_dir(root and vim.fs.relpath(cwd, root) and cwd)
  end,
  -- See https://www.npmjs.com/package/devsense-php-ls
  init_options = {
    ['0'] = '{}',
  },
  settings = {
    ["phpTools.language"] = "ru",
    ["php.inlayHints.parameters.enabled"] = false,
    ["php.problems.exclude"] = {
      ["bitrix/"] = true
    },
    ["php.codeActions.enabled"] = false,
    ["php.files.exclude"] = {
      ["**/upload"] = true,
      ["**/bitrix/cache"] = true,
      ["**/bitrix/managed_cache"] = true,
      ["**/bitrix/backup"] = true,
      ["**/bitrix/stack_cache"] = true,
      ["**/bitrix/wizards"] = true,
      ["**/install"] = true,
      ["**/templates"] = true,
      ["**/.access.php"] = true,
      ["**/lang"] = true,
      ["**/tmp"] = true
    },
    ["intelliphp.inlineSuggestionsEnabled"] = false,
    ["phpTools.suppressPremiumFeatures"] = true
  }

})
vim.lsp.enable("phptools")
