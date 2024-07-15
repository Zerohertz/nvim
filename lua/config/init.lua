local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("config.globals")

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins", opts = { colorscheme = "midnight" } },

    -- Dashboard --
    { "goolord/alpha-nvim", enabled = false },
    {
      "nvimdev/dashboard-nvim",
      event = "VimEnter",
      config = function()
        require("dashboard").setup({
          theme = "hyper",
          -- preview = {
          --   command = "cat",
          --   file_path = "~/.config/nvim/.header",
          --   file_height = 8,
          --   file_width = 80,
          -- },
          config = {
            header = {
              "███████╗███████╗██████╗  ██████╗ ██╗  ██╗███████╗██████╗ ████████╗███████╗",
              "╚══███╔╝██╔════╝██╔══██╗██╔═══██╗██║  ██║██╔════╝██╔══██╗╚══██╔══╝╚══███╔╝",
              "  ███╔╝ █████╗  ██████╔╝██║   ██║███████║█████╗  ██████╔╝   ██║     ███╔╝ ",
              " ███╔╝  ██╔══╝  ██╔══██╗██║   ██║██╔══██║██╔══╝  ██╔══██╗   ██║    ███╔╝  ",
              "███████╗███████╗██║  ██║╚██████╔╝██║  ██║███████╗██║  ██║   ██║   ███████╗",
              "╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝",
            },
            shortcut = {
              { desc = "[ https://github.com/Zerohertz]", group = "Label" },
            },
            project = {
              enable = true,
              limit = 12,
              icon = "🌲",
              label = " Recently Projects",
              action = "Telescope find_files cwd=",
            },
            mru = { limit = 12, icon = "📚", label = " Recent Files", cwd_only = true },
            footer = {
              "",
              "",
              "🛸　　　 　🌎　°　　🌓　•　　.°•　　　🚀 ✯",
              "　　　★　*　　　　　°　　　　🛰 　°·　　   🪐",
              ".　　　•　° ★　•  ☄",
              "▁▂▃▄▅▆▇▇▆▅▄▃▁▂",
            },
          },
        })
      end,
    },

    -- LSP --
    -- { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.clangd" },
    { import = "lazyvim.plugins.extras.lang.java" },
    { import = "lazyvim.plugins.extras.lang.docker" },
    -- { import = "lazyvim.plugins.extras.lang.markdown" },
    -- { import = "lazyvim.plugins.extras.lang.toml" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.yaml" },
    { import = "lazyvim.plugins.extras.lsp.none-ls" },
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = "*",
  },
})
