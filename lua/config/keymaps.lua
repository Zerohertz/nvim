local mapKey = require("utils.keymapper").mapKey

-- Clipboard
mapKey("<leader>y", '"+y', "v", { desc = "Copy to system clipboard" })

-- Cursor
mapKey("!", "^", "n", { desc = "Go to line start" })
mapKey("@", "$", "n", { desc = "Go to line end" })
mapKey("!", "^", "v", { desc = "Go to line start" })
mapKey("@", "$", "v", { desc = "Go to line end" })

-- Mark
mapKey("dm", ":delm!<CR>", "n", { desc = "Delete all marks" })

-- Lsp
mapKey("<leader>r", vim.lsp.buf.rename, "n", { desc = "Rename symbol" })
mapKey("gh", vim.lsp.buf.hover, "n", { desc = "Show hover info" })
mapKey("<leader>dd", vim.diagnostic.setqflist, "n", { desc = "Show diagnostics in quickfix" })

-- Buffer
mapKey("<leader>w", ":BufDel<CR>", "n", { desc = "Delete buffer" })

-- Tab
mapKey("tn", ":tabnew<CR>", "n", { desc = "New tab" })
mapKey("tw", ":tabclose<CR>", "n", { desc = "Close tab" })
mapKey("tl", ":tabnext<CR>", "n", { desc = "Next tab" })
mapKey("th", ":tabprev<CR>", "n", { desc = "Previous tab" })
mapKey("to", ":tabonly<CR>", "n", { desc = "Close other tabs" })
mapKey("tm", ":tabmove<CR>", "n", { desc = "Move tab" })

-- Neotree
mapKey("<leader>e", ":lua Snacks.explorer.open()<CR>", "n", { desc = "Toggle file explorer" })
-- mapKey("<leader>e", ":Neotree toggle<CR>")

-- Window control
mapKey("<C-a>", "<C-w>>", "n", { desc = "Increase window width" })
mapKey("<C-s>", "<C-w>-", "n", { desc = "Decrease window height" })
mapKey("<C-w>", "<C-w>+", "n", { desc = "Increase window height" })
mapKey("<C-d>", "<C-w><", "n", { desc = "Decrease window width" })

-- Window navigation
mapKey("<C-h>", "<C-w>h", "n", { desc = "Move to left window" })
mapKey("<C-j>", "<C-w>j", "n", { desc = "Move to bottom window" })
mapKey("<C-k>", "<C-w>k", "n", { desc = "Move to top window" })
mapKey("<C-l>", "<C-w>l", "n", { desc = "Move to right window" })

-- Clear search highlights
-- mapKey("<leader>h", ":nohlsearch<CR>")

-- Check health
mapKey("<leader>h", ":checkhealth<CR>", "n", { desc = "Run health check" })

-- Git diff
mapKey("<leader>gd", ":Gitsigns diffthis<CR>", "n", { desc = "Show git diff" })

-- Notifier history
mapKey("<leader>n", ":lua Snacks.notifier.show_history(opts)<CR>", "n", { desc = "Show notification history" })

-- Neovide specific keymaps
if vim.g.neovide then
  mapKey("<D-v>", '"+p', "n", { desc = "Paste from clipboard" })
  mapKey("<D-v>", "<C-R>+", "i", { desc = "Paste from clipboard" })
  mapKey("<D-v>", "<C-R>+", "c", { desc = "Paste from clipboard" })
  mapKey("<D-v>", "<C-R>+", "t", { desc = "Paste from clipboard" })
  mapKey("<D-c>", '"+y', "v", { desc = "Copy to clipboard" })
end
