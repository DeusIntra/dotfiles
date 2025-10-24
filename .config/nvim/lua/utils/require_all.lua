local get_files_from_dir = require("utils.get_files_from_dir")
local exclude_values     = require("utils.exclude")

local function require_all(dir, exclude)
  local files = get_files_from_dir(dir)
  if exclude then
    files = exclude_values(files, exclude)
  end
  for _, v in ipairs(files) do
    if v ~= 'init' then
      require(string.gsub(dir, '/', '.') .. '.' .. v)
    end
  end
end

return require_all
