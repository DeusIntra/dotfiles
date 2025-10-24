local function for_each(tbl, func)
  for _, v in pairs(tbl) do
    func(v)
  end
end

return for_each
