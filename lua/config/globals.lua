local function is_ssh()
  local ssh_client = vim.env.SSH_CLIENT
  local ssh_tty = vim.env.SSH_TTY
  return ssh_client ~= nil or ssh_tty ~= nil
end

local function is_docker()
  local docker_env = vim.env.DOCKER_ENV
  local docker_cgroup = io.open("/proc/1/cgroup", "r")
  if docker_cgroup then
    for line in docker_cgroup:lines() do
      if line:match("docker") then
        docker_cgroup:close()
        return true
      end
    end
    docker_cgroup:close()
  end
  return docker_env ~= nil
end

vim.g.mapleader = " " -- global leader
vim.g.maplocalleader = " " -- local leader

if is_ssh() or is_docker() then
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
