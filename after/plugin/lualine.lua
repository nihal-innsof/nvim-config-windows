local status, lualine = pcall(require, "lualine")
if (not status) then return end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {
        'NvimTree',
      },
    }
  },
  sections = {
    lualine_a = {
      'mode',
      'vim.g.flutter_tools_decorations.device'
    },
    lualine_b = {
      {
        'branch',
        icon = {
          '',
          color = {
            fg = '#ff7527'
          }
        },
      },
    },
    lualine_c = {
      {
        'tabs',
        mode = 2,
        use_mode_colors = true,
      },
      {
        'filename',
        file_status = true,
        path = 4,
        newfile_status = true,
        symbols = {
          modified = '[]',
          readonly = '[]',
          newfile = '[]',
          unnamed = '[]'
        },
      },
    },
    lualine_x = {
      "os.date('%I:%M:%S %p')",
      'flutter_tools_decorations.device',
      {
        'diagnostics',
        sources = { "nvim_diagnostic" },
        symbols = {
          error = ' ',
          warn = ' ',
          info = ' ',
          hint = ' '
        }
      },
      'encoding',
      {
        'filetype',
      },
      'searchcount',
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {
      "os.date('%Y-%m-%d %I:%M:%S %p')",
    },
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 0            -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    },
    lualine_x = { 'location' },
    lualine_y = {
      'windows',
    },
    lualine_z = {}
  },
  tabline = {
  },
  winbar = {
  },
  extensions = { 'fugitive' }
}
