local function dump(o, indent)
  if not indent then indent = 0 end
  for k, v in pairs(o) do
    local formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      print(formatting)
      dump(v, indent + 1)
    elseif type(v) == 'boolean' then
      print(formatting .. tostring(v))
    else
      print(formatting .. v)
    end
  end
  -- if type(o) == 'table' then
  --    local s = '{ '
  --    for k,v in pairs(o) do
  --       if type(k) ~= 'number' then k = '"'..k..'"' end
  --       s = s .. '['..k..'] = ' .. dump(v) .. ','
  --    end
  --    return s .. '} '
  -- else
  --    return tostring(o)
  -- end
end

return dump
