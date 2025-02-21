local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local extras = require("luasnip.extras")
-- local l = extras.lambda
-- local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet
-- local k = require("luasnip.nodes.key_indexer").new_key

ls.add_snippets("all", {
  -- Ternary operator
  s("ternary", {
    -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
    i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
  })
})

ls.add_snippets("vue", {
  s("vue3-base-ts", {
    t({
      "<script setup lang=\"ts\">",
      "",
      "</script>",
      "",
      "<template>",
      "  ",
    }),
    i(0, "Hello World!"), t({ "",
    "</template>",
  })
  })
})

ls.add_snippets("vue", {
  s("vue3-props", {
    t({
      "const props = defineProps({",
      "  ",
    }),
    i(1, "item"), t(": { type: "), i(2, "String"), t(", "), i(3, "required: true"), t(" },"),
    t({ "", "})", })
  })
})

ls.add_snippets("sh", {
  s("shebang!", {
    t("#!/usr/bin/"), i(1, "bash"), t({ "", "" }), i(0)
  })
})

local exportDefaultFunction = {
  s("edf", {
    t("export default function "), i(1, "fun"), t({ "() {",
    "  " }), i(0), t({ "",
    "}" })
  })
}

ls.add_snippets("javascript", exportDefaultFunction)
ls.add_snippets("typescript", exportDefaultFunction)
ls.add_snippets("javascriptreact", exportDefaultFunction)
ls.add_snippets("typescriptreact", exportDefaultFunction)
