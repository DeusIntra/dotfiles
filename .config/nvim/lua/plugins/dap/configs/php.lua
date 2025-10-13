local dap = require("dap")
local get_project_root = require("utils/get_project_root")

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { vim.fn.stdpath('data') .. '/mason/packages/php-debug-adapter/extension/out/phpDebug.js' },
}

dap.configurations.php = {
  {
    name = "Listen for Xdebug",
    type = "php",
    request = "launch",
    port = 9003,
    pathMappings = {
      ["/var/www/html/www"] = get_project_root({".git"}),
      ["/var/www/html"] = get_project_root({".git"}),
    },
    -- hostname = "localhost",
    -- preLaunchTask = "DDEV: Enable Xdebug",
    -- postDebugTask = "DDEV: Disable Xdebug",
  },
}

