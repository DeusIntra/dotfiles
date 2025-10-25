local function map(tbl, func)
  local result = {}
  for k, v in pairs(tbl) do
    result[k] = func(v)
  end
  return result
end

return map
