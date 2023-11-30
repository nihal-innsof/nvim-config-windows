local status, whichKey = pcall(require, "which-key")

if (not status) then
  return
end

local keymaps = {
  q = {
    name = "Bufferline",
    l = { "<cmd>BufferLineCloseLeft<cr>", "Close tabs to left" },
    r = { "<cmd>BufferLineCloseRight<cr>", "Close tabs to right" },
    o = { "<cmd>BufferLineCloseOthers<cr>", "Close other tabs" },
    -- p = { "<cmd>ColorizerDetachFromBuffer<cr>", "Colorizer Detach" },
  }
}

whichKey.register(keymaps, {
  mode = 'n',
  prefix = '<leader>',
  noremap = true,
  silent = true,
})
