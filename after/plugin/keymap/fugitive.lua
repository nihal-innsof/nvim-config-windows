local status, whichkey = pcall(require, "which-key")

local keymap = {
}

whichkey.register(keymap, {
  mode = 'n',
  prefix = '<leader>',
  noremap = true,
  silent = true,
})
