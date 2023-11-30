require('telescope').load_extension('flutter')
local status, whichkey = pcall(require, "which-key")

local keymap = {
  f = {
    o = { ':FlutterOutlineToggle<CR>', 'Flutter Outline Toggle' },
    g = { ':!flutter gen-l10n<CR>', 'Run flutter generator for l10n' },
    c = { ':FlutterCopyProfilerUrl<CR>', 'Copy flutter profiler url' },
    l = { ':FlutterLogClear<CR>', 'Clear flutter log' },
    e = { ':FlutterEmulators<CR>', 'List all available emulators' },
    d = { ':FlutterDevices<CR>', 'List all available devices' },
    q = { ':FlutterQuit<CR>', 'Quit' }
  },
  a = {
    c = { ':Telescope<CR>', 'All commands' }
  },
  h = {
    r = { ':FlutterReload<CR>', 'Flutter hot reload' },
    R = { ':FlutterRestart<CR>', 'Flutter hot restart' },
  },
}

whichkey.register(keymap, {
  mode = 'n',
  prefix = '<leader>',
  noremap = true,
  silent = true,
})


-- vim.api.nvim_set_keymap('n', '<leader>fc', ':Telescope flutter commands<CR>', { noremap = true, silent = true })
