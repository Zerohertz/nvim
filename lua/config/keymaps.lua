local mapKey = require("utils.keymapper").mapKey

-- Clipboard
mapKey("<leader>y", '"+y', "v")

-- Cursor
mapKey("!", "^")
mapKey("@", "$")
mapKey("!", "^", "v")
mapKey("@", "$", "v")

-- Mark
mapKey("dm", ":delm!<CR>")

-- Lsp
mapKey("<leader>r", vim.lsp.buf.rename)
mapKey("gh", vim.lsp.buf.hover)
mapKey("<leader>dd", vim.diagnostic.setqflist)

-- Buffer
mapKey("<leader>w", ":BufDel<CR>")

-- Neotree
mapKey("<leader>e", ":lua Snacks.explorer.open()<CR>")
-- mapKey("<leader>e", ":Neotree toggle<CR>")

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
-- mapKey("<leader>h", ":nohlsearch<CR>")

-- Check health
mapKey("<leader>h", ":checkhealth<CR>")

-- Git diff
mapKey("<leader>gd", ":Gitsigns diffthis<CR>")

-- Notifier history
mapKey("<leader>n", ":lua Snacks.notifier.show_history(opts)<CR>")
