local function exclude(tbl, values)
  local exclude_set = {}
  for _, v in ipairs(values) do
    exclude_set[v] = true
  end

  local new_table = {}
  for _, v in ipairs(tbl) do
    if not exclude_set[v] then
      table.insert(new_table, v)
    end
  end

  return new_table
end

return exclude
