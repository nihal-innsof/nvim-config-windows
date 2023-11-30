local status, gitsigns = pcall(require, "gitsigns")

if (not status) then
  return
end

gitsigns.setup({
  current_line_blame = true,
  numhl = true,
  show_deleted = false,
  current_line_blame_opts = {
    virt_text_pos = 'eol'
  },
})
