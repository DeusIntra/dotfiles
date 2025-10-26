local dap = require("dap")
local get_project_root = require("utils/get_project_root")

local project_root = get_project_root({ ".git" })

local function ends_with(str, ending)
  return ending == "" or str:sub(- #ending) == ending
end

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { vim.fn.stdpath('data') .. '/mason/packages/php-debug-adapter/extension/out/phpDebug.js' },
}

local pathMappings;
if ends_with(project_root, 'www') then
  pathMappings = {
    ["/var/www/html/www"] = project_root,
  }
else
  pathMappings = {
    ["/var/www/html"] = project_root,
  }
end

dap.configurations.php = {
  {
    name = "Listen for Xdebug",
    type = "php",
    request = "launch",
    port = 9003,
    pathMappings = pathMappings,
    log = true,
  },
}
