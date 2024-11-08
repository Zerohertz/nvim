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
    { "LazyVim/LazyVim", import = "lazyvim.plugins", opts = { colorscheme = "catppuccin" } },

    -- Dashboard --
    { "goolord/alpha-nvim", enabled = false },
    {
      "nvimdev/dashboard-nvim",
      event = "VimEnter",
      config = function()
        require("dashboard").setup({
          theme = "hyper",
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
              {
                desc = "[💽 dadbod-ui]",
                group = "Label",
                action = "DBUI",
                key = "d",
              },
            },
            project = {
              enable = true,
              limit = 12,
              icon = "🌲",
              label = " Recently Projects",
              action = "Telescope find_files cwd=",
            },
            mru = { limit = 12, icon = "📚", label = " Recent Files", cwd_only = false },
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

    -- C++ --
    { import = "lazyvim.plugins.extras.lang.clangd" },
    { import = "lazyvim.plugins.extras.lang.cmake" },

    -- Rust --
    { import = "lazyvim.plugins.extras.lang.rust" },

    -- Go --
    { import = "lazyvim.plugins.extras.lang.go" },

    -- Java --
    { import = "lazyvim.plugins.extras.lang.java" },

    -- Python --
    -- { import = "lazyvim.plugins.extras.lang.python" },

    -- JavaScript & TypeScript --
    { import = "lazyvim.plugins.extras.lang.typescript" },

    -- SQL --
    { import = "lazyvim.plugins.extras.lang.sql" },

    -- Docker --
    { import = "lazyvim.plugins.extras.lang.docker" },

    -- Etc --
    { import = "lazyvim.plugins.extras.lang.git" },
    { import = "lazyvim.plugins.extras.lang.terraform" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.yaml" },
    { import = "lazyvim.plugins.extras.lang.helm" },
    { import = "lazyvim.plugins.extras.lang.toml" },
    -- { import = "lazyvim.plugins.extras.lang.markdown" },

    { import = "lazyvim.plugins.extras.lsp.none-ls" },
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = "*",
  },
})
