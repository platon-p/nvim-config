--[[
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
]]--
--[[
local postfix = require("luasnip.extras.postfix").postfix


local mySnippets = {
    [{ 'all' }] = {
        s("ternary", {
            -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
            i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
        }, {
            docstring = 'ternary operator',
        }),
        postfix(".arg", {
            i(1), f(function(_, parent)
            return "(" .. parent.snippet.env.POSTFIX_MATCH .. ")"
        end, {}),
        }),
    },
    [{ 'go' }] = {
        postfix('.len', {
            f(function (_, parent)
                return 'len(' .. parent.snippet.env.POSTFIX_MATCH .. ')'
            end)
        })
    },
    [{ 'java', 'cpp', 'cs' }] = {
        postfix('.not', f(function(_, parent)
            return '!' .. parent.snippet.env.POSTFIX_MATCH
        end))
    },
    [{ 'java', 'cpp' }] = {

        s('fori', {
            t('for (int i = 0; i < '), i(1, 'n'), t({ '; ++i) {', '\t' }),
            i(2, 'block'), t({ '', '}' })
        }),
        postfix('.if', {
            f(function(_, parent)
                return { 'if (' .. parent.snippet.env.POSTFIX_MATCH .. ') {', '\t' }
            end),
            i(1, 'block'),
            t({ '', '}' })
        }),
    },
    [{ 'cs' }] = {
        postfix('.if', {
            f(function(_, parent)
                return { 'if (' .. parent.snippet.env.POSTFIX_MATCH .. ')', '{', '\t' }
            end),
            i(1, 'block'),
            t({ '', '}' })
        }),
        s('fori', {
            t('for (int i = 0; i < '), i(1, 'n'), t({ '; ++i)', '{', '\t' }),
            i(2, 'block'), t({ '', '}' })
        }),
        s('cw', {
            t('Console.WriteLine('), i(1, 'text'), t(');')
        }),
        s('main', {
            t({ 'static void Main(string[] args)', '{', '\t' }),
            i(1, ''),
            t({ '', '}' })
        }),
        s('crl', {
            t({ 'Console.ReadLine();', '' })
        })
    },
    [{ 'java' }] = {
        s('sout', {
            t('System.out.println('), i(1, 'text'), t(');')
        }),
        s('psvm', {
            t({ 'public static void Main(String[] args) {', '' }),
            i(1, 'block'),
            t({ '', '}' }),
        }),
    },
    [{ 'py' }] = {
        s('main', {
            t({ "if __name__ == '__main__':", "\t" }),
            i(1)
        }),
    }
}

for k_, v in pairs(mySnippets) do
    for _, lang in pairs(k_) do
        ls.add_snippets(lang, v)
    end
end
]]--
return {
    'L3MON4D3/LuaSnip',
}
