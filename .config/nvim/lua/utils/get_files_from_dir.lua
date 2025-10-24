local map = require("utils.map")

local function strip_ending(file)
  return file:gsub("%.lua$", "")
end

local function get_files_from_dir(dir)
  local path = vim.fn.stdpath('config') .. '/lua/' .. dir
  return map(
    vim.fn.readdir(path, [[v:val =~ '\.lua$']]),
    strip_ending
  )
end

return get_files_from_dir
