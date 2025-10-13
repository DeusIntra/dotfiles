local dap = require("dap")
local get_project_root = require("utils/get_project_root")

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {
      vim.fn.stdpath('data') .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
      "${port}"
    },
  }
}

dap.configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
  {
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
}

dap.configurations.typescript = dap.configurations.javascript
