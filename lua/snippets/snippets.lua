local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

--https://sbulav.github.io/vim/neovim-setting-up-luasnip/
ls.add_snippets("typescript", {
        snip({
            trig = "lg",
            namr = "expand logging",
            dscr = "stringify your logs",

        }, {
            text("console.log(JSON.stringify("),
            insert(1, "var"),
            text(",2,null) + ' "),
            insert(2, "description of var"),
            text("')")
        }),
})

