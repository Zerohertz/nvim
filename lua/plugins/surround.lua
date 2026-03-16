return {
  "kylechui/nvim-surround",
  config = function()
    require("nvim-surround").setup({})
    vim.keymap.set("n", "ys", "<Plug>(nvim-surround-normal)")
    vim.keymap.set("n", "yss", "<Plug>(nvim-surround-normal-cur)")
    vim.keymap.set("n", "yS", "<Plug>(nvim-surround-normal-line)")
    vim.keymap.set("n", "ySS", "<Plug>(nvim-surround-normal-cur-line)")
    vim.keymap.set("x", "S", "<Plug>(nvim-surround-visual)")
    vim.keymap.set("x", "gS", "<Plug>(nvim-surround-visual-line)")
    vim.keymap.set("n", "ds", "<Plug>(nvim-surround-delete)")
    vim.keymap.set("n", "cs", "<Plug>(nvim-surround-change)")
    vim.keymap.set("n", "cS", "<Plug>(nvim-surround-change-line)")
  end,
}
