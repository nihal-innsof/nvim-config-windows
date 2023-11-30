local status, null_ls = pcall(require, "null-ls")

if not status then
  return
end

null_ls.setup{
  sources = {
    -- null_ls.builtins.formatting.dart_format,
    -- null_ls.builtins.completion.luasnip,
    -- null_ls.builtins.completion.spell,
  }
}
