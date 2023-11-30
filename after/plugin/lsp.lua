local status, lsp_zero = pcall(require, "lsp-zero")

if (not status) then
  return
end

lsp_zero.preset('recommended')

lsp_zero.ensure_installed({ 'tsserver', 'eslint', 'lua_ls' })

local cmp = require('cmp')

local cmp_mappings = lsp_zero.defaults.cmp_mappings({
  ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-y>"] = cmp.mapping.complete(),
  ["<C-e>"] = cmp.mapping.abort(),
  ["<CR>"] = cmp.mapping.confirm({
    select = false
  })
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

local lspkind = require('lspkind')

lsp_zero.setup_nvim_cmp({
  preselect = 'item',
  mapping = cmp_mappings,
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  view = {
    docs = {
      auto_open = true,
    }
  },
  sources = { {
    name = 'nvim_lsp',
    entry_filter = function(entry, _)
      return require('cmp.types').lsp.CompletionItemKind[entry:get_kind()] ~= 'Text'
    end
  }, {
    name = 'path'
  }, {
    name = 'luasnip'
  }, {
    name = 'buffer',
    keyword_length = 5,
  },
    {
      name = 'nvim_lua',
    }
  },
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
    })
  },
  sorting = {
    priority_weight = 1.0,
    comparators = {
      cmp.config.compare.score_offset,
      cmp.config.compare.locality,
      cmp.config.compare.recently_used,
      cmp.config.compare.score,
      cmp.config.compare.offset,
      cmp.config.compare.order,
    }
  }
})


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

local protocol = require('vim.lsp.protocol')

protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp_zero.on_attach(on_attach)

lsp_zero.capabilities = capabilities

---@diagnostic disable-next-line: undefined-global
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
})

local flutter = require('flutter-tools')

-- alternatively you can override the default configs
flutter.setup {
  ui = {
    -- the border type to use for all floating windows, the same options/formats
    -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
    border = "rounded",
    -- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
    -- please note that this option is eventually going to be deprecated and users will need to
    -- depend on plugins like `nvim-notify` instead.
    notification_style = 'plugin'
  },
  decorations = {
    statusline = {
      -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
      -- this will show the current version of the flutter app from the pubspec.yaml file
      app_version = true,
      -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
      -- this will show the currently running device if an application was started with a specific
      -- device
      device = true,
      -- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
      -- this will show the currently selected project configuration
      project_config = true,
    }
  },
  debugger = {          -- integrate with nvim dap + install dart code debugger
    enabled = false,
    run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
    -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
    -- see |:help dap.set_exception_breakpoints()| for more info
    -- exception_breakpoints = { "raised" }
    exception_breakpoints = {}
  },
  flutter_path = "C:/src/flutter/bin/flutter.bat", -- <-- this takes priority over the lookup
  fvm = false,                                     -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
  widget_guides = {
    enabled = true,
  },
  dev_log = {
    enabled = true,
    notify_errors = true, -- if there is an error whilst running then notify the user
    open_cmd = "tabnew",  -- command to use to open the log buffer
  },
  dev_tools = {
    autostart = true,          -- autostart devtools server if not detected
    auto_open_browser = false, -- Automatically opens devtools in the browser
  },
  outline = {
    open_cmd = "50vnew", -- command to use to open the outline buffer
    auto_open = false    -- if true this will open the outline automatically when it is first populated
  },
  lsp = {
    color = { -- show the derived colours for dart variables
      enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = false, -- highlight the background
      background_color = { r = 0, g = 27, b = 38 }, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
      foreground = true, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = "  ■■■■■■■ ", -- the virtual text character to highlight
    },
    -- on_attach = on_attach,
    -- capabilities = capabilities, -- e.g. lsp_status capabilities
    -- see the link below for details on each option:
    -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      analysisExcludedFolders = {
        "C:/src/flutter/bin/",
        "C:/Users/innso/AppData/Local/Pub/Cache/hosted/",
      },
      renameFilesWithClasses = "prompt", -- "always"
      enableSnippets = true,
      updateImportsOnRename = true,      -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
    }
  }
}

lsp_zero.setup()

-- require("fidget").setup({})
