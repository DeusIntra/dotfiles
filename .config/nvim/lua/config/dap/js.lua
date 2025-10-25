local dap = require("dap")
local get_project_root = require("utils/get_project_root")


for _, adapterType in ipairs({ "node", "chrome", "msedge" }) do
  local pwaType = "pwa-" .. adapterType

  dap.adapters[pwaType] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
      command = "node",
      args = {
        vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
        "${port}",
      },
    },
  }

  -- this allow us to handle launch.json configurations
  -- which specify type as "node" or "chrome" or "msedge"
  dap.adapters[adapterType] = function(cb, config)
    local nativeAdapter = dap.adapters[pwaType]

    config.type = pwaType

    if type(nativeAdapter) == "function" then
      nativeAdapter(cb, config)
    else
      cb(nativeAdapter)
    end
  end
end


local enter_launch_url = function()
  local co = coroutine.running()
  return coroutine.create(function()
    vim.ui.input({ prompt = "Enter URL: ", default = "http://localhost:5173" }, function(url)
      if url == nil or url == "" then
        return
      else
        coroutine.resume(co, url)
      end
    end)
  end)
end

local launchFileConfig = {
  type = "pwa-node",
  request = "launch",
  name = "Launch file using Node.js (nvim-dap)",
  program = "${file}",
  cwd = "${workspaceFolder}",
}

local attachToProcessConfig = {
  type = "pwa-node",
  request = "attach",
  name = "Attach to process using Node.js (nvim-dap)",
  processId = require("dap.utils").pick_process,
  cwd = get_project_root({ ".git", "package.json" })
}

local launchTsFileConfig = {
  type = "pwa-node",
  request = "launch",
  name = "Launch file using Node.js with ts-node/register (nvim-dap)",
  program = "${file}",
  cwd = "${workspaceFolder}",
  runtimeArgs = { "-r", "ts-node/register" },
  sourceMaps = true,
  -- preLaunchTask = "tsc: build - tsconfig.json",
}

local launchChromeConfig = {
  type = "pwa-chrome",
  request = "launch",
  name = "Launch Chrome (nvim-dap)",
  url = enter_launch_url,
  webRoot = get_project_root({ 'package.json', '.git' }),
  sourceMaps = true,
  -- preLaunchTask = "npm: dev",
}

local launchEdgeConfig = {
  type = "pwa-msedge",
  request = "launch",
  name = "Launch Edge (nvim-dap)",
  url = enter_launch_url,
  webRoot = get_project_root({ 'package.json', '.git' }),
  sourceMaps = true,
  -- preLaunchTask = "npm: dev",
}

local attachToNestjsConfig = {
  type = "pwa-node",
  request = "launch",
  name = "Debug Nest Framework",
  runtimeExecutable = "npm",
  runtimeArgs = { "run", "start:debug", "--", "--inspect-brk" },
  autoAttachChildProcesses = true,
  restart = true,
  sourceMaps = true,
  stopOnEntry = false,
  console = "integratedTerminal",
  cwd = get_project_root({ 'package.json', '.git' }),
}

for _, language in ipairs({ "typescriptreact", "javascriptreact", "vue" }) do
  dap.configurations[language] = {
    launchFileConfig,
    attachToProcessConfig,
    -- requires ts-node to be installed globally or locally
    launchTsFileConfig,
    launchChromeConfig,
    launchEdgeConfig,
  }
end

dap.configurations.typescript = {
  launchFileConfig,
  attachToProcessConfig,
  launchTsFileConfig,
  launchChromeConfig,
  launchEdgeConfig,
  attachToNestjsConfig,
}

dap.configurations.javascript = {
  launchFileConfig,
  attachToProcessConfig,
  launchChromeConfig,
  launchEdgeConfig,
  attachToNestjsConfig,
}
