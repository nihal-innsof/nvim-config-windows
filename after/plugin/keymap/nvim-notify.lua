local status, whichKey = pcall(require, "which-key")

local keymap = {
  c = {
    n = {
      function()
        require('notify').dismiss()
      end,
      "Clear notifications"
    }
  }
}

whichKey.register(keymap, {
  mode = 'n',
  noremap = true,
  silent = true,
})
