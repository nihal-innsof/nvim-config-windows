local status, whichkey = pcall(require, "which-key")
if (not status) then return end

local keymap = {
  t = {
    t = {
      '<cmd>:ZenMode<CR>', 'Toggle Zen Mode',
    }
  }
}

whichkey.register(keymap, { mode = 'n', noremap = true, silent = true })
