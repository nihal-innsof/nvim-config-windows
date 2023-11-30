local status, whichkey = pcall(require, "which-key")

local keymap = {
  t = {
    name = "TODO's",
    l = { ':TroubleToggle<CR>', 'List Todos' },
  }
}

whichkey.register(keymap, {
  mode = 'n',
  prefix = '<leader>',
  noremap = true,
  silent = true,
})
-- vim.api.nvim_set_keymap('n', '<leader>tl',':TodoLocList<CR>', { noremap = true, silent = true })
