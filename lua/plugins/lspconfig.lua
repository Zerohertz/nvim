return {
  "nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        handlers = {
          ["textDocument/publishDiagnostics"] = function() end,
        },
      },
      ruff_lsp = {
        on_attach = function(client, _)
          client.server_capabilities.hoverProvider = false
        end,
      },
      clangd = {
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
      },
    },
  },
}
