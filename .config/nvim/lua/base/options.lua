local opt = vim.opt

opt.number = true
opt.list = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.linebreak = true
opt.clipboard = "unnamedplus"

opt.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldclose:'
opt.foldcolumn = '1'
opt.foldenable = true
-- opt.foldexpr = 'v:lua.vim.lsp.foldexpr()' -- reserved for when fixed
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldmethod = 'expr'
