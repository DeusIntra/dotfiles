require('ts_context_commentstring').setup {
  enable_autocmd = false,
  languages = {
    jsonc = {
      __default = '// %s',
    }
  }
}

require("Comment").setup({
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  ignore = '^$'
})

