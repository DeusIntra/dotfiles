local get_files_from_dir = require("utils.get_files_from_dir")
local dap_list = get_files_from_dir("config/dap")
require("mason-nvim-dap").setup({
  ensure_installed = dap_list
})

local dap = require("dap")
local dapui = require("dapui")
dapui.setup()
require("nvim-dap-virtual-text").setup()

dap.listeners.before.attach.dapui_config = function ()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function ()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function ()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function ()
  dapui.close()
end

vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "➤", texthl = "", linehl = "", numhl = "" })

vim.keymap.set('n', '<F4>', dapui.close)

--[[ Setup all dap configs ]]--
local require_all = require("utils.require_all")
require_all("config/dap")

vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>B', dap.set_breakpoint)
vim.keymap.set('n', '<leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<leader>dr', dap.repl.open)
vim.keymap.set('n', '<leader>dl', dap.run_last)

