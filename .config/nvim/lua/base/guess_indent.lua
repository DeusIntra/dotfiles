local function is_space_indent()
  local tab_count = 0
  local space_count = 0

  -- Look at the first 250 lines to determine indentation
  for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, 250, false)) do
    if line:match('^\t') then
      tab_count = tab_count + 1
    elseif line:match('^ ') then
      space_count = space_count + 1
    end
  end

  return tab_count <= space_count
end

vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function ()
    vim.bo.expandtab = is_space_indent()
  end
})
