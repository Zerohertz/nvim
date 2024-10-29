local function is_ssh()
  local ssh_client = vim.env.SSH_CLIENT
  local ssh_tty = vim.env.SSH_TTY
  return ssh_client ~= nil or ssh_tty ~= nil
end

local function is_container()
  if vim.fn.filereadable("/.dockerenv") == 1 then
    return true
  end
  if os.getenv("KUBERNETES_SERVICE_HOST") then
    return true
  end
  return false
end

vim.g.mapleader = " " -- global leader
vim.g.maplocalleader = " " -- local leader

if is_ssh() or is_container() then
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.java",
  callback = function()
    vim.cmd("lua require'jdtls'.organize_imports()")
  end,
})
