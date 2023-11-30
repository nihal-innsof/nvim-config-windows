local status, ls = pcall(require, 'luasnip')

if (not status) then
  return
end

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local ret_filename = function()
  local filename = vim.fn.expand("%:t")
  -- INFO: get filename without extension
  local dotIndex = filename:find("%.[^%.]+$") -- Find the last dot in the string
  if dotIndex then
    return filename:sub(1, dotIndex - 1)      -- Extract the portion of the string before the dot
  else
    return filename                           -- No extension found, return the original string
  end
end

-- add custom snippet using luasnip
-- INFO: dart/flutter snippets
ls.add_snippets("dart", {
  s("todo:AddToLocalization", {
    t("// TODO: Add to localization")
  }),
  s("todo:SplitNdAddToLocalization", {
    t("// TODO: Split and add to localization")
  }),
  s("ctx-lang", {
    t("context.lang."),
    i(1, "languageKey"),
    t(","),
  }),
  s("ptf", {
    t("part 'generated/"),
    f(function()
      local filename = ret_filename()
      return filename
    end),
    t(".freezed.dart';"),
  }),
  s("ptj", {
    t("part 'generated/"),
    f(function()
      local filename = ret_filename()
      return filename
    end),
    t(".g.dart';"),
  })
})
