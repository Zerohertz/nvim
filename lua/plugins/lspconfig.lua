return {
  "nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        handlers = {
          ["textDocument/publishDiagnostics"] = function() end,
        },
      },
      ruff = {
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
