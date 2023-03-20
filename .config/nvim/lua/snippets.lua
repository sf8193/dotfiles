local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local log = function() return {"console.log(JSON.stringify(,2,null))"} end

ls.add_snippets(nil, {
    ts = {
        snip({
            trig = "log",
            namr = "Log",
            dscr = "stringify",
        }, {
            func(log, {}),
        }),
    },
})
