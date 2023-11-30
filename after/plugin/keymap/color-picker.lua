local status, whichKey = pcall(require, "which-key")

if (not status) then
  return
end

local keymaps = {
  p = {
    name = "Color Picker",
    c = { "<cmd>PickColor<cr>", "Colorizer" },
    -- p = { "<cmd>ColorizerDetachFromBuffer<cr>", "Colorizer Detach" },
  }
}

whichKey.register(keymaps, {
  mode = 'n',
  prefix = '<leader>',
  noremap = true,
  silent = true,
})
