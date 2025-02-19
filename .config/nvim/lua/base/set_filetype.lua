local function set_filetype(pattern, filetype)
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = pattern,
    command = "set filetype=" .. filetype,
  })
end

set_filetype({
  "docker*.yml*",
  "docker*.yaml*",
  "*compose*.yml*",
  "*compose*.yaml*",
}, "yaml.docker-compose")

