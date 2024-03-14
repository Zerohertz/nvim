local Util = require("lazyvim.util")

return {
  "nvimtools/none-ls.nvim",
  event = "LazyFile",
  init = function()
    Util.on_very_lazy(function()
      require("lazyvim.util").format.register({
        name = "none-ls.nvim",
        priority = 200,
        primary = true,
        format = function(buf)
          return Util.lsp.format({
            bufnr = buf,
            filter = function(client)
              return client.name == "null-ls"
            end,
          })
        end,
        sources = function(buf)
          local ret = require("null-ls.sources").get_available(vim.bo[buf].filetype, "NULL_LS_FORMATTING") or {}
          return vim.tbl_map(function(source)
            return source.name
          end, ret)
        end,
      })
    end)
  end,
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.root_dir = opts.root_dir
      or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
    opts.sources = vim.list_extend(opts.sources or {}, {
      -- nls.builtins.diagnostics.ruff,
      -- nls.builtins.diagnostics.mypy,
      -- nls.builtins.diagnostics.pylint.with({
      --   diagnostics_postprocess = function(diagnostic)
      --     diagnostic.code = diagnostic.message_id
      --   end,
      -- }),
      nls.builtins.formatting.isort,
      nls.builtins.formatting.black,
    })
  end,
}
