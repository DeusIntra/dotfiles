local js_formatters = { "prettierd", "prettier", stop_after_first = true }
local formatters_by_ft = {
  php = { "pretty-php" },
  python = { "isort", "black" },
  javascriptreact = js_formatters,
  typescriptreact = js_formatters,
  javascript = js_formatters,
  typescript = js_formatters,
  vue = js_formatters,
  json = js_formatters,
  jsonc = js_formatters,
}

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>lf",
      function()
        -- if vim.bo.filetype == 'vue' then
        --   vim.lsp.buf.format()
        -- else
          require("conform").format({ async = true })
        -- end
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = formatters_by_ft,
    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
    -- Set up format-on-save
    --format_on_save = { timeout_ms = 500 },
    -- Customize formatters
    --formatters = { shfmt = { append_args = { "-i", "2" }, }, },
  },
  --init = function()
  -- If you want the formatexpr, here is the place to set it
  --vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  --end,
}
