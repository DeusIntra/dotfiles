local linters = require("plugins/lint/lint-list")

require("mason-nvim-lint").setup({
  ensure_installed = linters
})

local lint = require("nvim-lint")
lint.linters_by_ft = {
  sh = "shellcheck",
  text = "vale",
}

