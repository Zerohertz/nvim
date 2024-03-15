local mapKey = require("utils.keymapper").mapKey

-- Buffer
mapKey("<leader>w", ":BufDel<CR>")

-- Neotree toggle
mapKey("<leader>e", ":Neotree toggle<CR>")

-- Window control
mapKey("<C-a>", "<C-w>>") -- Left
mapKey("<C-s>", "<C-w>-") -- Down
mapKey("<C-w>", "<C-w>+") -- Up
mapKey("<C-d>", "<C-w><") -- Right

-- Window navigation
mapKey("<C-h>", "<C-w>h") -- Left
mapKey("<C-j>", "<C-w>j") -- Down
mapKey("<C-k>", "<C-w>k") -- Up
mapKey("<C-l>", "<C-w>l") -- Right

-- Clear search highlights
mapKey("<leader>h", ":nohlsearch<CR>")
