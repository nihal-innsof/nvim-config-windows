---@diagnostic disable: undefined-global
local status, nvim_tree = pcall(require, "nvim-tree")

if (not status) then
  return
end

nvim_tree.setup({
  hijack_cursor = true,
  disable_netrw = true,
  hijack_unnamed_buffer_when_opening = true,
  select_prompts = true,
  git = {
    enable = true,
  },
  view = {
    adaptive_size = false,
  },
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  renderer = {
    -- indent_width = 3,
    highlight_git = false,
    highlight_diagnostics = true,
    highlight_opened_files = "none",
    highlight_modified = "icon",
    full_name = true,
    root_folder_modifier = ":t",
    indent_markers = {
      enable = true,
    },
    icons = {
      web_devicons = {
        file = {
          enable = true,
          color = true,
        },
        folder = {
          enable = true,
          color = true,
        },
      },
      git_placement = "after",
      show = {
        diagnostics = true,
        modified = false,
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        git = {
          unstaged = "U",
          staged = "S",
          unmerged = "UM",
          renamed = "R",
          untracked = "UT",
          deleted = "D",
          ignored = "I",
        },
      }
    }
  },
  hijack_directories = {
    enable = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    severity = {
      min = vim.diagnostic.severity.INFO,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      error = ' ',
      warning = ' ',
      info = ' ',
      hint = ' '
    },
  },
  modified = {
    enable = true,
    show_on_open_dirs = false,
  },
  actions = {
    change_dir = {
      enable = false,
      restrict_above_cwd = true,
    }
  },
  tab = {
    sync = {
      open = true,
      close = true,
    }
  }
})
