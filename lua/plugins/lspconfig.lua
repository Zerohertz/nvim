return {
  "nvim-lspconfig",
  opts = {
    servers = {
      ruff_lsp = {
        on_attach = function(client, _)
          client.server_capabilities.hoverProvider = false
        end,
      },
    },
  },
}
