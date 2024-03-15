return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- Lua --
      "stylua",

      -- Python --
      -- "mypy",
      -- "pylint",
      "isort",
      "black",

      -- Markdown --
      "markdownlint",
    },
  },
}
