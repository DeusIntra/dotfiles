-- Oil
vim.keymap.set("n", "<leader>pp", "<CMD>Oil<CR>")
vim.keymap.set("n", "<leader>po", "<CMD>tabnew<CR><CMD>Oil<CR>")

-- Neoscroll
local neoscroll = require("neoscroll")
local keymap = {
  ["<PageUp>"] = function() neoscroll.ctrl_b({ duration = 200 }) end;
  ["<PageDown>"] = function() neoscroll.ctrl_f({ duration = 200 }) end;
  -- ["G"] = function()
  --   neoscroll.G({ half_win_duration = 50 })
  --   vim.cmd("normal L")
  -- end;
  -- ["gg"] = function()
  --   neoscroll.gg({ half_win_duration = 50 })
  --   vim.cmd("normal H")
  -- end;
}
for key, func in pairs(keymap) do
  vim.keymap.set({"n", "v", "x"}, key, func)
end
