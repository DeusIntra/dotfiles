local cmp = require('cmp')
local luasnip = require("luasnip")
local lspkind = require("lspkind")

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    -- A super tab
    -- sourc: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
    ["<Tab>"] = cmp.mapping(function(fallback)
        -- Hint: if the completion menu is visible select next one
        if cmp.visible() then
            cmp.select_next_item()
        elseif has_words_before() then
            cmp.complete()
        else
            fallback()
        end
    end, { "i", "s" }), -- i - insert mode; s - select mode
    ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable( -1) then
            luasnip.jump( -1)
        else
            fallback()
        end
    end, { "i", "s" }),
  }),

  -- Let's configure the item's appearance
  -- source: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
  formatting = {
    -- Set order from left to right
    -- kind: single letter indicating the type of completion
    -- abbr: abbreviation of "word"; when not empty it is used in the menu instead of "word"
    -- menu: extra text for the popup menu, displayed after "word" or "abbr"
    fields = { "abbr", "kind", "menu" },

    -- customize the appearance of the completion menu
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = {
        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        -- can also be a function to dynamically calculate max width such as
        -- menu = function() return math.floor(0.45 * vim.o.columns) end,
        menu = 50, -- leading text (labelDetails)
        abbr = 50, -- actual suggestion item
      },
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      show_labelDetails = true, -- show labelDetails in menu. Disabled by default

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        if entry.source.name == 'nvim_lsp' and entry.source.source.client.name == 'marksman' and vim_item.kind == 'Reference' then
          vim_item.word = '<' .. vim_item.word:gsub("%%(%x%x)", function(hex)
            return string.char(tonumber(hex, 16))
          end) .. '>'
        end
        vim_item.menu = ({
            nvim_lsp = "[Lsp]",
            luasnip = "[Luasnip]",
            buffer = "[File]",
            path = "[Path]",
        })[entry.source.name]
        return vim_item
      end
    })
  },

  sources = cmp.config.sources({
    { name = "luasnip" },     -- For luasnip user
    { name = "nvim_lsp" },    -- For nvim-lsp
    { name = "buffer" },      -- For buffer word completion
    { name = "path" },        -- For path completion
  }, {
    { name = 'buffer' },
  })
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
})
require("cmp_git").setup() ]]-- 

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local get_files_from_dir = require('utils.get_files_from_dir')
local lsp_list = get_files_from_dir('config/lsp')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, lsp in ipairs(lsp_list) do
  local opts = require("config.lsp." .. lsp)
  if opts['capabilities'] == nil then
    opts['capabilities'] = capabilities
  end
  vim.lsp.config(lsp, opts)
end

vim.lsp.enable(lsp_list)

