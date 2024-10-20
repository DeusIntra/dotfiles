vim.keymap.set({ "n" }, "<leader>lf", function() vim.lsp.buf.format() end)
vim.keymap.set({ "n" }, "<leader>rr", function() vim.lsp.buf.rename() end)
vim.keymap.set({ "n" }, "<leader>rf", function() vim.lsp.buf.references() end)
vim.keymap.set({ "n" }, "<leader>gd", function() vim.lsp.buf.definition() end)

vim.keymap.set({ "n" }, "<leader>e", function() vim.diagnostic.open_float() end)
