local function get_project_root(root_markers)
  local current_file = vim.fn.expand('%:p')
  if current_file == '' then
    current_file = vim.fn.getcwd()
  end

  -- Look for common project markers
  -- local root_markers = {
  --   'composer.json', '.git', 'ddev.config.yaml', 
  --   'package.json', 'Makefile', 'README.md'
  -- }

  local found = vim.fs.find(root_markers, { path = current_file, upward = true })[1]
  if found then
    return vim.fs.dirname(found)
  end

  -- Fallback: use current file directory or working directory
  if current_file ~= vim.fn.getcwd() then
    return vim.fn.fnamemodify(current_file, ':h')
  end

  return vim.fn.getcwd()
end

return get_project_root
