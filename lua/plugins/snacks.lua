return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    -- https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md
    dashboard = {
      preset = {
        header = [[
███████╗███████╗██████╗  ██████╗ ██╗  ██╗███████╗██████╗ ████████╗███████╗
╚══███╔╝██╔════╝██╔══██╗██╔═══██╗██║  ██║██╔════╝██╔══██╗╚══██╔══╝╚══███╔╝
  ███╔╝ █████╗  ██████╔╝██║   ██║███████║█████╗  ██████╔╝   ██║     ███╔╝ 
 ███╔╝  ██╔══╝  ██╔══██╗██║   ██║██╔══██║██╔══╝  ██╔══██╗   ██║    ███╔╝  
███████╗███████╗██║  ██║╚██████╔╝██║  ██║███████╗██║  ██║   ██║   ███████╗
╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝]],
      },
      sections = {
        { section = "header" },
        { icon = " ", title = "Projects", section = "projects", limit = 12, indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", limit = 12, indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
  },
}
