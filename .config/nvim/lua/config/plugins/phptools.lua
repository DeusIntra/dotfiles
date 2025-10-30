local function devsense_installed()
  return vim.fn.executable('devsense-php-ls') == 1
end

local function npm_installed()
  return vim.fn.executable('npm') == 1
end

local function ensure_devsense_installed(callback)
  if devsense_installed() then
    callback(true)
    return
  end


  local need_installing = vim.fn.input("Install devsense-php-ls? [Y/n]:")
  if string.lower(need_installing) == 'n' then
    callback(false)
    return
  end


  if not npm_installed() then
    vim.notify("npm is not installed", vim.log.levels.ERROR)
    callback(false)
    return
  end

  vim.notify("Installing devsense-php-ls via npm...", vim.log.levels.INFO)

  local install_handle = vim.uv.spawn(
    'npm', { args = { 'install', '-g', 'devsense-php-ls' } },
    function(install_code)
      if install_code == 0 then
        vim.notify("devsense-php-ls installed successfully!", vim.log.levels.INFO)
        callback(true)
      else
        vim.notify("Error installing devsense-php-ls. Exit code: " .. install_code, vim.log.levels.ERROR)
        callback(false)
      end
    end)

  install_handle:close()
end

-- Асинхронная настройка LSP
ensure_devsense_installed(function(success)
  if not success then
    vim.notify("LSP phptools is not installed", vim.log.levels.WARN)
    return
  end

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
end)
