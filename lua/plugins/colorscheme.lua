return {
  "dasupradyumna/midnight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("midnight").setup({
      -- Comment = {
      --   fg = "#FF0000",
      --   style = "italic"
      -- },
      -- HighlightGroup = {
      --   fg = ForegroundColor, -- :h guifg
      --   bg = "#800A0A", -- :h guibg
      --   sp = SpecialColor, -- :h guisp
      --   style = RenderStyle, -- :h attr-list
      --   link = TargetHiglightGroup -- :h :hi-link (link to "TargetHiglightGroup")
      --   clear = true, -- :h :hi-clear (clear "HighlightGroup"; `false` ignores this option)
      -- },
    })
    -- require("midnight").load()
  end,
}
