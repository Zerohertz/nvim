-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local mapKey = require("utils.keymapper").mapKey

-- Buffer
mapKey("<leader>w", ":BufDel<CR>")

-- Neotree toggle
mapKey("<leader>e", ":Neotree toggle<CR>")

-- Pane navigation
mapKey("<C-h>", "<C-w>h") -- Left
mapKey("<C-j>", "<C-w>j") -- Down
mapKey("<C-k>", "<C-w>k") -- Up
mapKey("<C-l>", "<C-w>l") -- Right

-- Clear search highlights
mapKey("<leader>h", ":nohlsearch<CR>")
