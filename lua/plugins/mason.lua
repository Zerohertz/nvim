return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      -- Shell --
      "shfmt",

      -- C++ --
      "clangd",
      "cmakelang",
      "cmakelint",
      "neocmakelsp",

      -- Rust --
      "codelldb",

      -- Go --
      "gofumpt",
      "goimports",
      "gomodifytags",
      "gopls",
      "impl",

      -- Java --
      "gradle-language-server",
      "java-test",
      "jdtls",

      -- Python --
      "ruff",
      "pyright",
      -- "isort",
      -- "black",
      -- "mypy",
      -- "pylint",

      -- JavaScript & TypeScript --
      "eslint-lsp",

      -- SQL --
      "sqlfluff",

      -- Docker --
      "docker-compose-language-service",
      "dockerfile-language-server",
      "hadolint",

      -- gRPC --
      "buf",

      -- Etc --
      "helm-ls",
      "json-lsp",
      "lua-language-server",
      "markdownlint",
      "prettier",
      "stylua",
      "taplo",
      "terraform-ls",
      "tflint",
      "vtsls",
      "yaml-language-server",
    },
  },
}
