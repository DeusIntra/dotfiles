local linters_by_ft = {
  sh = { "shellcheck" },
  dockerfile = { "hadolint" },
  json = { "jsonlint" },
  tsx = { "eslint_d" },
  cpp = { "cpplint" },
  markdown = { "markdownlint" },
}


local ensure_installed = {}
for _, v in pairs(linters_by_ft) do
  for _, linter in ipairs(v) do
    table.insert(ensure_installed, linter)
  end
end

require("mason-nvim-lint").setup({
  ensure_installed = ensure_installed,
  automatic_installation = false,
})

local lint = require("lint")
lint.linters_by_ft = linters_by_ft

-- Show linters for the current buffer's file type
vim.api.nvim_create_user_command("LintInfo", function()
  local filetype = vim.bo.filetype
  local linters = lint.linters_by_ft[filetype]
  if linters then
    if type(linters) == "string" then
      print("Linter for " .. filetype .. ": " .. linters)
    else
      print("Linters for " .. filetype .. ": " .. table.concat(linters, ", "))
    end
  else
    print("No linters configured for filetype: " .. filetype)
  end
end, {})

vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "BufReadPost", "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

