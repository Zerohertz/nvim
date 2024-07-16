return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- Shell --
      "shfmt",

      -- Lua --
      "lua-language-server",
      "stylua",

      -- Python --
      "black",
      "isort",
      "pyright",
      "ruff-lsp",
      -- "mypy",
      -- "pylint",

      -- Go --
      "gofumpt",
      "goimports",
      "gomodifytags",
      "gopls",
      "impl",

      -- C, C++ --
      "clangd",

      -- Java --
      "java-test",
      "jdtls",

      -- Docker --
      "hadolint",
      "docker-compose-language-service",
      "dockerfile-language-server",

      -- HTML --
      "prettier",

      -- Markdown --
      "markdownlint",

      -- JSON --
      "json-lsp",

      -- YAML --
      "yaml-language-server",
    },
  },
}
