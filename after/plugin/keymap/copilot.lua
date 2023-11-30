local status, whichkey = pcall(require, "which-key")

local keymap = {
  c = {
    name = "Copilot",
    d = { ':Copilot disable<CR>', 'Disable Copilot' },
    e = { ':Copilot enable<CR>', 'Enable Copilot' },
  }
}

whichkey.register(keymap, {
  mode = 'n',
  prefix = '<leader>',
  noremap = true,
  silent = true,
})

--[[ vim.api.nvim_set_keymap('n', '<leader>cd', ':Copilot disable<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ce', ':Copilot enable<CR>', { noremap = true, silent = true }) ]]
