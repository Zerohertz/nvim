return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- Shell --
      "shfmt",

      -- Lua --
      "stylua",

      -- Python --
      -- "mypy",
      -- "pylint",
      "isort",
      "black",

      -- Go --
      "gomodifytags",
      "impl",
      "goimports",
      "gofumpt",

      -- Docker --
      "hadolint",

      -- Markdown --
      "markdownlint",
    },
  },
}
