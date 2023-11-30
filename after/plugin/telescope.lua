local status, telescope = pcall(require, 'telescope')
if (not status) then return end
local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    sorting_strategy = "ascending",
    dynamic_preview_title = true,
    layout_config = {
      height = 0.4,
      -- width = 0.9,
      prompt_position = "top",
      anchor = 'S'
    },
    mappings = {
      n = {
        ['q'] = actions.close
      },
      i = {
        ['<C-b>'] = actions.preview_scrolling_up,
        ['<C-f>'] = actions.preview_scrolling_down,
      }
    }
  }
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>ff',
  '<cmd>lua require("telescope.builtin").find_files({ no_ignore = false, hidden = true })<cr>', opts)
vim.keymap.set('n', '<leader>fr',
  '<cmd>lua require("telescope.builtin").live_grep({ no_ignore = false, hidden = true })<cr>', opts)

--[[ local status, telescope = pcall(require, 'telescope')
if (not status) then return end
local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    ripgrep_arguments = {
      'rg',
      '--hidden',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    dynamic_preview_title = true,
    layout_strategy = 'horizontal',
    layout_config = {
      height = 100,
      width = 0.9,
    },
    mappings = {
      n = {
        ['q'] = actions.close
      },
      i = {
        ['<C-b>'] = actions.preview_scrolling_up,
        ['<C-f>'] = actions.preview_scrolling_down,
      }
    }
  },
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>ff',
  '<cmd>lua require("telescope.builtin").find_files({ no_ignore = false, hidden = true })<cr>', opts)
vim.keymap.set('n', '<leader>fr',
  '<cmd>lua require("telescope.builtin").live_grep({ no_ignore = false, hidden = true })<cr>', opts)
vim.keymap.set('n', '<leader>fs',
  '<cmd>lua require("telescope.builtin").grep_string({ no_ignore = false, hidden = true, use_regex = true })<cr>', opts)

require('telescope').load_extension('fzf') ]]
