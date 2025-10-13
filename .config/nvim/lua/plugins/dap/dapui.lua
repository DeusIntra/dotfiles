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
--vim.fn.sign_define("DapStopped", { text = "→", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "➤", texthl = "", linehl = "", numhl = "" })

vim.keymap.set('n', '<F4>', dapui.close)
-- →
-- ⟴
-- ⟶
-- ⟹
-- ⟾
-- ⟿
-- ⤃
-- ⤇
-- ⤏
-- ⤗
-- ⤘
-- ⤜
-- ⤠
-- ⤷
-- ➤
-- ➧
-- ➨
-- ➼

