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
    -- WARN: 최신 버전에선 아래 오류 발생
    -- Failed to run `config` for bufferline.nvim
    -- ...re/nvim/lazy/LazyVim/lua/lazyvim/plugins/colorscheme.lua:61: attempt to call field 'get_theme' (a nil value)
    -- # stacktrace:
    --   - /LazyVim/lua/lazyvim/plugins/colorscheme.lua:61 _in_ **values**
    {
      "LazyVim/LazyVim",
      version = "14.15.1",
      import = "lazyvim.plugins",
      opts = { colorscheme = "catppuccin" },
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
    { import = "lazyvim.plugins.extras.lang.svelte" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },

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
