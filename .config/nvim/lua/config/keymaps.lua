-- Oil
vim.keymap.set("n", "<leader>pp", "<CMD>Oil<CR>")
vim.keymap.set("n", "<leader>po", "<CMD>tabnew<CR><CMD>Oil<CR>")

-- Neoscroll
local neoscroll = require("neoscroll")
local keymap = {
  ["<PageUp>"] = function() neoscroll.ctrl_b({ duration = 200 }) end,
  ["<PageDown>"] = function() neoscroll.ctrl_f({ duration = 200 }) end,
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
  vim.keymap.set({ "n", "v", "x" }, key, func)
end

-- Luasnip
local ls = require("luasnip")
-- vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-H>", function() ls.jump(-1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

-- LSP
-- vim.keymap.set({ "n" }, "<leader>lf", function() vim.lsp.buf.format() end)
vim.keymap.set({ "n" }, "<leader>rn", function() vim.lsp.buf.rename() end)
vim.keymap.set({ "n" }, "<leader>rf", function() vim.lsp.buf.references() end)
vim.keymap.set({ "n" }, "<leader>gd", function() vim.lsp.buf.definition() end)
vim.keymap.set({ "n" }, "<leader>e", function() vim.diagnostic.open_float() end)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
