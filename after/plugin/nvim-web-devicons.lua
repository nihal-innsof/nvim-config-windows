local status, icons = pcall(require, "nvim-web-devicons")
if (not status) then return end

icons.setup {
  default = true,
  strict = false,
  override_by_filename = {
    [".gitignore"] = {
      icon = "",
      color = "#f1502f",
      name = "Gitignore"
    }
  },
  override_by_extension = {
    ["log"] = {
      icon = "",
      color = "#81e043",
      name = "Log"
    }
  }
}
